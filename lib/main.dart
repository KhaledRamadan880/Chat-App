import 'package:chat_app/app/app.dart';
import 'package:chat_app/core/database/cache/cache.dart';
import 'package:chat_app/core/database/services/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serviceInit();
  await serviceLocator<Cache>().cacheInit();
  // await Cache().cacheInit();
  runApp(const MyApp());
}
