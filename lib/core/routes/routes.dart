import 'package:chat_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:chat_app/features/auth/presentation/screens/on_boarding_screens.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:chat_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:chat_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = '/splah';
  static const String onBoarding = '/onBoarding';
  static const String signIN = '/signIN';
  static const String signUp = '/signUp';
  static const String forgetPass = '/forgetPass';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreens());
      case Routes.signIN:
        return MaterialPageRoute(builder: (context) => const SigninScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routes.forgetPass:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordScreen());
    }
    return null;
  }
}
