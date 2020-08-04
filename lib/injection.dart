import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';
import 'package:http/http.dart' as http;

final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);

  // External - Http Client
  getIt.registerLazySingleton(() => http.Client());

  // External - NetworkInfo
  getIt.registerLazySingleton(() => DataConnectionChecker());
}
