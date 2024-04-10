import 'package:flutter/material.dart';
import 'package:nsb_remit/screens/error/error_screen.dart';
import 'package:nsb_remit/screens/initial/spalsh_screen.dart';
import '../utils/constants/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
