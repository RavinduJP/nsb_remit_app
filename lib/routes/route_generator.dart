import 'package:flutter/material.dart';
import 'package:nsb_remit/screens/auth/login/log_in_screen.dart';
import 'package:nsb_remit/screens/auth/register/otp_verification.dart';
import 'package:nsb_remit/screens/auth/register/proof_documents.dart';
import 'package:nsb_remit/screens/auth/register/quick_setup.dart';
import 'package:nsb_remit/screens/auth/register/scan_passport.dart';
import 'package:nsb_remit/screens/auth/register/scan_visa.dart';
import 'package:nsb_remit/screens/auth/register/security_verification.dart';
import 'package:nsb_remit/screens/auth/register/upload_selfie.dart';
import 'package:nsb_remit/screens/auth/register/user_Registration.dart';
import 'package:nsb_remit/screens/error/error_screen.dart';
import 'package:nsb_remit/screens/home_screen.dart';
import 'package:nsb_remit/screens/initial/spalsh_screen.dart';
import '../screens/auth/register/create_pin.dart';
import '../screens/auth/register/sign_up_details.dart';
import '../utils/constants/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

        case Routes.logInScreen:
        return MaterialPageRoute(
          builder: (_) => const LogInScreen(),
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

      case Routes.userRagistrationScreen:
        return MaterialPageRoute(
          builder: (_) => const UserRegistration(),
        );

      case Routes.scanPassportScreen:
        return MaterialPageRoute(
          builder: (_) => ScanPassport(),
        );

        case Routes.scanVisaScreen:
        return MaterialPageRoute(
          builder: (_) => ScanVisa(),
        );

        case Routes.uploadSelfieScreen:
        return MaterialPageRoute(
          builder: (_) => UploadSelfie(),
        );

        case Routes.securityVerificationScreen:
        return MaterialPageRoute(
          builder: (_) => const SecurityVerification(),
        );

        case Routes.createPinScreen:
        return MaterialPageRoute(
          builder: (_) => const CreatePin(),
        );

        case Routes.quickSetUpScreen:
        return MaterialPageRoute(
          builder: (_) => const QuickSetUp(),
        );

        case Routes.proofDocumentsScreen:
        return MaterialPageRoute(
          builder: (_) => ProofDocuments(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
