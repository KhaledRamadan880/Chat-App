import 'package:chat_app/app/app.dart';
import 'package:chat_app/core/database/cache/cache.dart';
import 'package:chat_app/core/database/services/service_locator.dart';
import 'package:chat_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  serviceInit();
  await serviceLocator<Cache>().cacheInit();

  runApp(
    BlocProvider(
      create: (context) => AuthCubit(),
      child: const MyApp(),
    ),
  );
}
