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
