import 'package:chat_app/core/database/cache/cache.dart';
import 'package:chat_app/core/database/services/service_locator.dart';
import 'package:chat_app/core/routes/routes.dart';
import 'package:chat_app/core/theme/theme.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/utils/app_strings.dart';
import 'package:chat_app/core/utils/commons.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isStarted =  serviceLocator<Cache>().getBool(key: 'isStarted') ?? false;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        isStarted == true
            ? navigateReplacement(context: context, route: Routes.signIN)
            : navigateReplacement(context: context, route: Routes.onBoarding);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.chatApp,
              style: appTheme().textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
