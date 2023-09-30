import 'package:fitopia/presentation/chat/chat_inner_screen.dart';
import 'package:fitopia/presentation/chat/chat_screen.dart';
import 'package:fitopia/presentation/ebook/ebook_screen.dart';
import 'package:fitopia/presentation/forgot/change_password_screeen.dart';
import 'package:fitopia/presentation/forgot/forgot_pas_screen.dart';
import 'package:fitopia/presentation/forgot/forgot_verify_otp_screen.dart';
import 'package:fitopia/presentation/help/help_screen.dart';
import 'package:fitopia/presentation/home/home_screen.dart';
import 'package:fitopia/presentation/introduction/introduction_screen.dart';
import 'package:fitopia/presentation/language_selection/language_select_screen.dart';
import 'package:fitopia/presentation/login/login_screen.dart';
import 'package:fitopia/presentation/logout/logout_screen.dart';
import 'package:fitopia/presentation/my_meal_plans/my_meal_plans_screen.dart';
import 'package:fitopia/presentation/my_profile/my_profile_screen.dart';
import 'package:fitopia/presentation/my_program/my_program_screen.dart';
import 'package:fitopia/presentation/nutrition/nutrition_screen.dart';
import 'package:fitopia/presentation/onboarding/onboarding1_screen.dart';
import 'package:fitopia/presentation/receipe_list/receipe_list_screen.dart';
import 'package:fitopia/presentation/settings/settings_screen.dart';
import 'package:fitopia/presentation/signup/signup_screen.dart';
import 'package:fitopia/presentation/splash/splash_screen.dart';
import 'package:fitopia/presentation/subscription/selected_package_screen.dart';
import 'package:fitopia/presentation/subscription/subscription_screen.dart';
import 'package:fitopia/presentation/workout_routine/workout_routine_screen.dart';
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
  static const String SettingsPageRoute = "/SettingsView";
  static const String chatPageRoute = "/ChatView";
  static const String chatInnerViewPageRoute = "/ChatInnerView";
  static const String myProfilePageRoute = "/myProfileView";
  static const String myProgramPageRoute = "/myProgramView";
  static const String myMealsPlansPageRoute = "/myMealsPlansView";
  static const String workoutRoutinePageRoute = "/workoutRoutineView";
  static const String nutritionPageRoute = "/nutritionView";
  static const String ebookPageRoute = "/ebookView";
  static const String helpPageRoute = "/helpView";
  static const String logoutPageRoute = "/logoutView";
  static const String receipePageRoute = "/receipeView";
  static const String subscriptionViewPageRoute = "/SubscriptionView";
  static const String CreaditCardAddViewPageRoute = "/CreaditCardAddView";
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
      case Routes.SettingsPageRoute:
        return MaterialPageRoute(builder: (_) => SettingsView());
      case Routes.chatPageRoute:
        return MaterialPageRoute(builder: (_) => ChatView());
      case Routes.chatInnerViewPageRoute:
        return MaterialPageRoute(builder: (_) => ChatInnerView());
      case Routes.myProfilePageRoute:
        return MaterialPageRoute(builder: (_) => MyProfileView());
      case Routes.myProgramPageRoute:
        return MaterialPageRoute(builder: (_) => MyProgramView());
      case Routes.myMealsPlansPageRoute:
        return MaterialPageRoute(builder: (_) => MyMealsPlanView());
      case Routes.receipePageRoute:
        return MaterialPageRoute(builder: (_) => ReceipeListView());
      case Routes.workoutRoutinePageRoute:
        return MaterialPageRoute(builder: (_) => WorkoutRoutineView());
      case Routes.nutritionPageRoute:
        return MaterialPageRoute(builder: (_) => NutritionView());
      case Routes.ebookPageRoute:
        return MaterialPageRoute(builder: (_) => EbookView());
      case Routes.helpPageRoute:
        return MaterialPageRoute(builder: (_) => HelpView());
      case Routes.logoutPageRoute:
        return MaterialPageRoute(builder: (_) => LogoutView());
      case Routes.subscriptionViewPageRoute:
        return MaterialPageRoute(builder: (_) => SubscriptionView());
      case Routes.CreaditCardAddViewPageRoute:
        return MaterialPageRoute(builder: (_) => CreaditCardAddView());

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
