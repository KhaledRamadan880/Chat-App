import 'package:chat_app/core/database/cache/cache.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
void serviceInit() {
  serviceLocator.registerLazySingleton<Cache>(() => Cache());
}
