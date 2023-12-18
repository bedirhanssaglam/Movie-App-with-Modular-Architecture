import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gen/gen.dart';
import 'package:lottie/lottie.dart';
import 'package:moviemodular/product/utility/constants/app_constants.dart';

extension LottieExtension on LottieGenImage {
  LottieBuilder lottieBuilder({double height = 150}) =>
      lottie(package: AppConstants.genPackageName, height: height.h);
}

extension SvgExtension on SvgGenImage {
  SvgPicture toSvg({double height = 200}) =>
      this.svg(package: AppConstants.genPackageName, height: height.h);
}
