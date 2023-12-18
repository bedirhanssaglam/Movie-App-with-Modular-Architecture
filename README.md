<div align="center">
    <h1>Movie App with Modular Architecture in Flutter</h1>
</div>

Bu proje, [Veli Bacik](https://github.com/VB10/architecture_template_v2) tarafından oluşturulan ve sunulan mimari template üzerine oluşturulmuştur. Template büyük oranda aynıdır fakat bazı farkılılıklar mevcuttur. Bu sebeple, burada farklı, eksik ya da hatalı olabilecek bir kod dizini/anlatım template sahibine mal edilmemelidir.

Klasör yapısı:

```
📂 lib
  📂 development  
  📂 features   
  📂 product
  📄 main.dart
📂 module
  📂 common
  📂 gen
  📂 widget   
📂 test
  📂 models
  📂 network
  📂 view_model  
📄 build.yaml
📄 pubspec.yaml      
```
**lib/**
* **development:** Bu klasör `preview_main.dart` dosyasını içerir. `main.dart`'tan farklı olarak [Device Preview](https://pub.dev/packages/device_preview) paketi vasıtasıyla projenin farklı cihazlarda görünümünü incelememize olanak sağlar.
```dart
runApp(
    DevicePreview(
      builder: (context) =>
          StateInitialize(child: ProductLocalization(child: const _MyApp())),
    ),
  );
```
* **features:** Bu klasör uygulamanın sayfalarını ve yönetimini içerir. İçindeki bir klasörü (home) ele alacak olursak;
```
📂 features
 📂 home
  📂 view
   📂 mixin
    📄 home_view_mixin.dart
   📂 widget
    📄 home_appbar.dart
   📄 home_view.dart
  📂 view_model
   📂 mixin 
    📄 home_view_model_mixin.dart
   📄 home_view_model.dart 
```
**view:** view klasörü mixin ve widget klasörünü ve `home_view.dart` dosyasını içerir. mixin klasörü `home_view_mixin.dart` dosyasını içerir ve burada HomeView'da kullanılacak bazı işlevleri tanımlayabiliriz.
```dart
base mixin HomeViewMixin on State<HomeView> {
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;

  @override
  void initState() {
    super.initState();
    _homeViewModel = HomeViewModel(
      operationService: MovieService(ProductStateItems.productNetworkManager),
    )..fetchTopRatedMovies();
  }
}
```
:warning: `base mixin`, `with` ile kullanıma izin verir ve kullanıldığı yerin `final` olması gerekir. Daha detaylı bilgi için Dart dokümantasyonundaki [Class modifiers reference](https://dart.dev/language/modifier-reference) bölümünü inceleyiniz.

Widget klasörü bu sayfaya (home) özgü widget'ları kapsar.

`home_view.dart` kullanıcı arayüzünü oluşturan kodların bulunduğu dosyadır.

**view_model:** view_model klasörü bizim business kodlarımızı içerir.

```dart
/// Manage home view business logic
final class HomeViewModel extends BaseCubit<BaseState<Movie>> {
  /// [MovieOperation] service
  HomeViewModel({
    required MovieOperation operationService,
  })  : _movieOperationService = operationService,
        super(const BaseState.initial());

  final MovieOperation _movieOperationService;

  /// Fetch top rated movies
  Future<void> fetchTopRatedMovies() async {
    emit(const BaseState<Movie>.loading());
    try {
      final response = await _movieOperationService.fetchTopRatedMovies();
      emit(BaseState<Movie>.success(response!));
    } catch (_) {
      emit(BaseState<Movie>.error(LocaleKeys.home_error.localize));
    }
  }
}
```
Burada [Cubit](https://pub.dev/packages/flutter_bloc) kullanılarak HomeViewModel oluşturuluyor ve en çok oylanan filmler servis isteğindeki duruma göre ilgili state'i emit ediyor.

:warning: Buradaki `BaseState` bu projeye özgüdür. Bu projede her sayfada tek bir servis çalıştığı için yazılmıştır. Aynısını farklı bir projede kullanmanız sorunlara yol açabilir, bilindik yollara başvurmak daha sağlıklı olacaktır.

* **product:** product klasörü oldukça kapsamlıdır. Projenin bazı katmanlarını burada yönetiriz. İçinde 6 klasör bulunmaktadır;
```
📂 product
 📂 init
 📂 routes
 📂 service
 📂 state
 📂 utility
 📂 widget
 ```

**init:** init klasörü environmentları, çoklu dil desteği ve tema yönetimi gibi işlevleri içerir.

**routes:** routes klasörü yönlendirme işlerinin yönetildiği kısımdır. Burada [auto_route](https://pub.dev/packages/auto_route) paketi kullanılmıştır.

**service:** service klasörü isteklerin yönetildiği yerdir. Servisler [vexana](https://pub.dev/packages/vexana) paketiyle yönetilmiştir. Bu paket, [dio](https://pub.dev/packages/dio) üzerine yazılmıştır. Ayrıca sade bir kullanım sunar.
```
📂 init
 📂 service
  📂 interceptor
  📂 interface
  📂 manager
   📄 product_network_manager.dart
  📄 movie_service.dart 
```
`product_network_manager.dart` şöyledir:
```dart
typedef OnErrorStatus = ValueChanged<int>;

/// Product network manager
final class ProductNetworkManager extends NetworkManager<EmptyModel> {
  ProductNetworkManager.base()
      : super(
          options: BaseOptions(
            baseUrl: AppEnvironmentItems.baseUrl.value,
            queryParameters: {
              AppConstants.apiKeyParameter: AppEnvironmentItems.apiKey.value,
            },
          ),
        );

  /// Handle error
  /// [onErrorStatus] is error status code [HttStatus]
  void listenErrorState({required OnErrorStatus onErrorStatus}) {
    interceptors.add(
      ProductInterceptor(onErrorStatus: onErrorStatus),
    );
  }
}
```
Network manager'a optionslar ve interceptorlar ekleyebiliriz.
:warning: Bu projedeki tüm servis isteklerinde `api_key` query parametresi zorunlu olduğundan burada verilmiştir.

**state:** state klasörü `base`, `container` ve `view_model` klasörlerini içerir ve projenin ana state katmanı, locatorlar ve projenin tamamında geçerli state yönetimi (örn. temanın yönetimi) burada yapılır.

**utility:** utility klasörü constants, enums ve extensions klasörlerini içerir. Ayrıca, projede kullanılan BorderRadius'ların bulunduğu `app_border_radius.dart` dosyasını da içerir.

**widget:** Burada proje genelinde kullanılan widgetlar (örn.AppBottomNavigationBar) bulunur. Ek olarak, paket ile kazanılan bazı widgetlar (örn. ProjectCachedImage) module altındaki widgets klasöründe oluşturulup burada tanımlanır ve projede kullanılırken buradan çağırılır.

:warning: bloc ve list_view klasörleri içerisindeki widgetlar bu projeye özgüdür. Bu projede kod tekrarının önüne geçip projenin her yerinde sorunsuz çalışmaktadır.

**module/**
* **common:** Burada paketler ile elde ettiğimiz 2 widget'ı ([carousel_slider](https://pub.dev/packages/carousel_slider) ve [cached_network_image](https://pub.dev/packages/cached_network_image)) daha sonra lib/product/widget altında kullanmak üzere burada tanımladık. Bunlardan `CarouselSliderBuilder`'ı inceleyelim;
```
 📂 common
  📂 lib
   📂 src
    📂 package
     📂 carousel_slider
      📄 carousel_slider_builder.dar
      📄 carousel_builder_size.dart
      📄 index.dart
  📄 pubspec.yaml      
```
*pubspec.yaml:*
```yaml
dependencies:
  flutter:
    sdk: flutter
  # Slider widget item
  carousel_slider: ^4.2.1  
  # Network image to cache
  cached_network_image: ^3.3.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  # Lint rules  
  very_good_analysis: ^5.1.0
```

```dart
import 'package:carousel_slider/carousel_slider.dart';
import 'package:common/src/package/carousel_slider/carousel_slider_size.dart';
import 'package:flutter/material.dart';

typedef CarouselWidgetBuilder = Widget Function(int index);

final class CarouselSliderBuilder extends StatelessWidget {
  const CarouselSliderBuilder({
    required this.widgetBuilder,
    required this.itemCount,
    super.key,
    this.enlargeCenterPage,
    this.carouselSliderSize = const CarouselSliderSize(),
    this.autoPlay = false,
    this.disableCenter = true,
  });

  final int itemCount;
  final CarouselWidgetBuilder widgetBuilder;
  final CarouselSliderSize carouselSliderSize;
  final bool autoPlay;
  final bool disableCenter;
  final bool? enlargeCenterPage;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        enlargeCenterPage: enlargeCenterPage,
        disableCenter: disableCenter,
        autoPlay: autoPlay,
        scrollDirection: scrollDirection,
        scrollPhysics: const BouncingScrollPhysics(),
        aspectRatio: carouselSliderSize.aspectRatio,
        viewportFraction: carouselSliderSize.viewportFraction,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index, _) => widgetBuilder(index),
    );
  }
}
```

Daha sonra `lib/product/widget/carousel_slider/project_carousel_slider.dart` dosyasında;

```dart
import 'package:common/common.dart';
import 'package:flutter/material.dart';

final class ProjectCarouselSlider extends StatelessWidget {
  const ProjectCarouselSlider({
    required this.widgetBuilder,
    required this.itemCount,
    super.key,
  });

  final Widget Function(int) widgetBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return CarouselSliderBuilder(
      itemCount: itemCount,
      widgetBuilder: widgetBuilder,
      enlargeCenterPage: true,
    );
  }
}
```

* **gen:** Burada modellerin, assetlerin ve environmentsların generate işlemlerini tutarız. Klasör yapısı şöyledir;
```
 📂 gen
  📂 asset
   📂 environments
   📂 icons
   📂 lottie
  📂 lib
   📂 src
    📂 asset
    📂 environments
     📄 dev_env.dart
     📄 dev_env.g.dart
     📄 environment_configuration.dart
     📄 index.dart
    📂 models
  📄 gen.dart
  📄 pubspec.yaml 
```

Buradaki environment yönetimini ele alalım. module/gen/asset/environments/.dev.env dosyasında;

```.env
BASE_URL = https://api.themoviedb.org/3/
API_KEY = YOUR_API_KEY
```

`API_KEY`'i [Movie Database](https://developer.themoviedb.org/docs/getting-started)'i ziyaret edip alabilirsiniz.

`environment_configuration.dart` dosyasında bir abstract class oluştururuz. 
```dart
/// The above class is an abstract interface class for app configuration.
abstract class EnvironmentConfiguration {
  /// it using from network manager
  String get baseUrl;

  /// it using from movie api key
  String get apiKey;
}
```

```dart
import 'package:envied/envied.dart';
import 'package:gen/src/environments/environment_configuration.dart';

part 'dev_env.g.dart';

@Envied(path: 'asset/environments/.dev.env', obfuscate: true)
/// Production environment variables
final class DevEnv implements EnvironmentConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _DevEnv._baseUrl;

  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _DevEnv._apiKey;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get apiKey => _apiKey;
}
```
Bu işlemler için [envied](https://pub.dev/packages/envied), [envied_generator](https://pub.dev/packages/envied_generator) ve [build_runner](https://pub.dev/packages/build_runner) paket kullandık. Bağımlılıkları projeye eklemek için aşağıdaki komutları çalıştırın.

```sh
$ flutter pub add envied
$ flutter pub add --dev envied_generator
$ flutter pub add --dev build_runner
```

> ÖNEMLİ! Hem `.env` hem de `env.g.dart` dosyalarını `.gitignore` dosyanıza ekleyin, aksi takdirde ortam değişkenlerinizi açığa çıkarabilirsiniz.

Oluşturduğunuz dosyayı generate etmek için aşağıdaki komutu terminalden çalıştırmalısınız.

```sh
dart run build_runner build
```

Daha sonra lib/product/config/app_environment.dart dosyası altında bunun tanımlamasını yaparız.

```dart
import 'package:gen/gen.dart';

/// Application environment manager class
final class AppEnvironment {
  /// Setup application environment
  AppEnvironment.setup({required EnvironmentConfiguration config}) {
    _config = config;
  }

  /// General application environment setup
  AppEnvironment.general() {
    _config = DevEnv();
  }

  static late final EnvironmentConfiguration _config;
}

/// Get application environment items
enum AppEnvironmentItems {
  /// Network base url
  baseUrl,

  /// Google maps api key
  apiKey;

  /// Get application environment item value
  String get value {
    try {
      switch (this) {
        case AppEnvironmentItems.baseUrl:
          return AppEnvironment._config.baseUrl;
        case AppEnvironmentItems.apiKey:
          return AppEnvironment._config.apiKey;
      }
    } catch (_) {
      throw Exception('AppEnvironment is not initialized.');
    }
  }
}
```

Son olarak `runApp`'ten önce bunu çağırırız. Eğer network test oluşturuyorsak bunu `setUp`'ta çağırırız.
```dart
void main() {
  late final ProductNetworkManager manager;
  setUp(() {
    AppEnvironment.general();
    manager = ProductNetworkManager.base();
  });
  test('fetch top rated movies from api', () async {
    final response = await manager.send<Movie, Movie>(
      ProductServicePath.topRated.path,
      parseModel: Movie(),
      method: RequestType.GET,
    );

    expect(response.data, isNotNull);
    expect(response.data!.results, isNotEmpty);
  });
}
```

* **widgets:** Burada atomic widgetlar yer alır. Örneğin uygulamada kullanılacak base dialog'u ve responsive için kullandığımız yapıyı burada tanımlarız.

```dart
import 'package:flutter/material.dart' show Size;

/// Design size for project
enum DesignSize {
  designSize(Size(390, 844));

  const DesignSize(this.size);

  final Size size;
}
```
```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/src/utility/enums/design_size.dart';

/// Custom responsive for project
class CustomResponsive extends StatelessWidget {
  const CustomResponsive({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: DesignSize.designSize.size,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, _) => child,
    );
  }
}
```

Ve daha sonra;
```dart
import 'package:widgets/widgets.dart';

final class _MyApp extends StatelessWidget {
  const _MyApp();

  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return CustomResponsive( // from widgets module
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        routerConfig: _MyApp._appRouter.config(),
        theme: LightThemeManager().themeData,
        darkTheme: DarkThemeManager().themeData,
        themeMode: context.watch<ProductViewModel>().state.themeMode,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
```
**test/**
Burada testlerimiz yer alır. Model, servis istekleri ve ViewModel'lar için testler yazılmıştır. Klasör ve dosyalama aşağıdaki gibidir. 

`CategoryViewModel` için testi inceleyelim.

```
📂 test
  📂 view_model
   📂 category
    📄 category_service_mock.dart 
    📄 category_view_model_test.dart
   📂 details
   📂 discover
   📂 home
```     

Testler için bize üç bağımlılık gerekiyor.
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.0.2
  bloc_test: ^9.1.4
```

[mockito](https://pub.dev/packages/mockito) ve [bloc_test](https://pub.dev/packages/bloc_test) bağımlılıklarını ekledikten sonra `category_service_mock.dart` dosyasını oluşturuyoruz. Burada bu paketlerin kullanımı ve detayları anlatılmayacaktır.

```dart
import 'package:gen/gen.dart';
import 'package:mockito/mockito.dart';
import 'package:moviemodular/product/service/interface/movie_operation.dart';

final class CategoryServiceMock extends Mock implements MovieOperation {
  @override
  Future<Genres> fetchAllCategories() async {
    return Genres(
      genres: [
        GenresData(id: 1, name: 'Action'),
        GenresData(id: 2, name: 'Comedy'),
      ],
    );
  }
}
```
Artık CategoryViewModel'ı test edebiliriz.
```dart
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:moviemodular/features/category/view_model/category_view_model.dart';
import 'package:moviemodular/product/state/base/base_state.dart';

import 'category_service_mock.dart';

void main() {
  late final CategoryViewModel categoryViewModel;

  final mockGenresItem = Genres(
    genres: [
      GenresData(id: 1, name: 'Action'),
      GenresData(id: 2, name: 'Comedy'),
    ],
  );

  setUp(() {
    categoryViewModel =
        CategoryViewModel(operationService: CategoryServiceMock());
  });

  group('CategoryViewModel', () {
    test('initial state is BaseState<Genres>.initial', () {
      expect(
        categoryViewModel.state,
        equals(const BaseState<Genres>.initial()),
      );
    });

    blocTest<CategoryViewModel, BaseState<Genres>>(
      'emits [BaseState<Genres>.loading, BaseState<Genres>.success] '
      'when categories are loaded successfully',
      build: () => categoryViewModel,
      act: (viewModel) async => viewModel.fetchAllCategories(),
      expect: () => [
        const BaseState<Genres>.loading(),
        BaseState<Genres>.success(mockGenresItem),
      ],
    );
  });
}
```

Önce gerekli kurulumları `setUp` içerisinde yaptık ve daha sonra ViewModel'ın davranışını State üzerinden kontrol ettik.
<div align="center">
    <h1>SON</h1>
</div>

---
Burada yer almayan kodlar için projeyi inceleyebilir, arkasındaki düşünce ve kodlar üzerinde daha fazla bilgi için [Flutter Architecture Template v2 (Türkçe)](https://www.youtube.com/playlist?list=PL1k5oWAuBhgUAFNvxdF6wIuC9cfvN5PrZ) oynatma listesini izleyebilirsiniz. Bu proje, oynatma listesindeki yaklaşım üzerinde pratik ve farklı bazı denemeler (`BaseBlocWidget` gibi) yapmak için oluşturulmuştur.

Bir hata olduğunu düşünüyorsanız fikirlerinizi paylaşmaktan çekinmeyin. Okuduğunuz için teşekkürler! :slightly_smiling_face: