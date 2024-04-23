import 'package:flutter/material.dart';
import 'package:nsb_remit/screens/auth/register/otp_verification.dart';
import 'package:nsb_remit/screens/error/error_screen.dart';
import 'package:nsb_remit/screens/home_screen.dart';
import 'package:nsb_remit/screens/initial/spalsh_screen.dart';
import '../screens/auth/register/sign_up_details.dart';
import '../utils/constants/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case Routes.signUpDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpDetails(),
        );

      case Routes.otpVerificationScreen:
        return MaterialPageRoute(
          builder: (_) => const OtpVerification(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
