import 'package:fitopia/presentation/forgot/change_password_screeen.dart';
import 'package:fitopia/presentation/forgot/forgot_pas_screen.dart';
import 'package:fitopia/presentation/forgot/forgot_verify_otp_screen.dart';
import 'package:fitopia/presentation/home/home_screen.dart';
import 'package:fitopia/presentation/introduction/introduction_screen.dart';
import 'package:fitopia/presentation/language_selection/language_select_screen.dart';
import 'package:fitopia/presentation/login/login_screen.dart';
import 'package:fitopia/presentation/onboarding/onboarding1_screen.dart';
import 'package:fitopia/presentation/signup/signup_screen.dart';
import 'package:fitopia/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String mainRoute = "/main";
  static const String loginRoute = "/login";
  static const String signUp1Route = "/SignUp1";
  static const String introductionRoute = "/introduction";
  static const String forgotPasswordRoute = "/ForgotPassword";
  static const String OtpVerificationRoute = "/OtpVerificationView";
  static const String ChangePasswordViewRoute = "/ChangePasswordView";
  static const String Onboarding1Route = "/Onboarding1View";
  static const String LanguageSelectPageRoute = "/LanguageSelcetPage";
  static const String HomePageRoute = "/HomeView";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.introductionRoute:
        return MaterialPageRoute(builder: (_) => IntroductionPage());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.signUp1Route:
        return MaterialPageRoute(builder: (_) => SignUp1());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.OtpVerificationRoute:
        return MaterialPageRoute(builder: (_) => OtpVerificationView());
      case Routes.ChangePasswordViewRoute:
        return MaterialPageRoute(builder: (_) => ChangePasswordView());
      case Routes.Onboarding1Route:
       // return MaterialPageRoute(builder: (_) => Onboarding2());
        return MaterialPageRoute(builder: (_) => Onboarding1View());
      case Routes.LanguageSelectPageRoute:
        return MaterialPageRoute(builder: (_) => LanguagePage());
      case Routes.HomePageRoute:
        return MaterialPageRoute(builder: (_) => HomeView());


      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text("No Route Found")),
              body: Center(child: Text("No Route Found")),
            ));
  }
}
