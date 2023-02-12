import 'package:fitopia/presentation/resources/index_manager.dart';
import 'package:flutter/material.dart';class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
      backgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: ColorManager.primarydarkColor,
      primarySwatch: Colors.teal,
      backgroundColor: Colors.black,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),
    )
  };
}enum AppTheme {
  lightTheme,
  darkTheme,
}


// import 'package:fitopia/presentation/resources/index_manager.dart';
// import 'package:flutter/material.dart';

// enum AppTheme { LightTheme, DarkTheme }

//  final static  appThemeData = {

// // 
//   AppTheme.LightTheme: ThemeData(
//     brightness: Brightness.light,
//     primaryColor: Colors.white,
//     secondaryHeaderColor: Colors.black,
//     backgroundColor: ColorManager.whiteColor,
//     scaffoldBackgroundColor: ColorManager.whiteColor,
//     textTheme: TextTheme(
//       bodyText1: TextStyle(color: Colors.white),
//     ),
//   ),

//   AppTheme.DarkTheme: ThemeData(
//     brightness: Brightness.dark,
//     // primaryColor: Colors.black54,
//     secondaryHeaderColor: Colors.white,
//     backgroundColor: ColorManager.blackColor,
//     scaffoldBackgroundColor: ColorManager.blackColor,
//     textTheme: TextTheme(
//       bodyText1: TextStyle(color: Colors.white),
//     ),
//   ),
// };
