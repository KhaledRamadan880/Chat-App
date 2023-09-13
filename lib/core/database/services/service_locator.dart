import 'package:chat_app/core/database/cache/cache.dart';
import 'package:chat_app/features/auth/data/repository/auth_repo.dart';
import 'package:chat_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;
void serviceInit() {
  // Cubits
  serviceLocator.registerLazySingleton(() => AuthCubit(serviceLocator()));
  // Features
  serviceLocator.registerLazySingleton(() => AuthRepo());
  // External
  serviceLocator.registerLazySingleton<Cache>(() => Cache());
}
