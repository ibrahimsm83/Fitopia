import 'package:easy_localization/easy_localization.dart';
import 'package:fitopia/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../presentation/resources/color_manager.dart';
import '../presentation/resources/routes_manager.dart';

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key); //default constractor

//Private named constractor
  MyApp._internal();

//Single Instance--Singleton
  static final MyApp instance = MyApp._internal();

//factory for the class instance
  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: ColorManager.greyColor,
        statusBarIconBrightness: Brightness.light));
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return BlocProvider(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, ThemeState themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fitopia',
            theme: themeState.themeData,
            // themeMode: ThemeMode.system,
            // darkTheme: getApplicationTheme(),
            // theme: getApplicationTheme(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // theme: ThemeData(
            //     primarySwatch: Colors.blue,
            //     unselectedWidgetColor: HexColor.fromHex("#D3D3D3")),
            darkTheme: ThemeData.dark()
                .copyWith(primaryColor: Color.fromARGB(255, 85, 56, 54)),
            // ThemeData(
            //   fontFamily: FontConstants.fontFamily,
            //   primarySwatch: myappColor,
            // ),
            //home: Container(),
            initialRoute: Routes.splashRoute,
            onGenerateRoute: RouteGenerator.getRoute,
          );
        }),
      );
    });
  }

  MaterialColor myappColor = const MaterialColor(
    0xFF27B0FF,
    <int, Color>{
      50: Color(0xFFFE4E2D), //10%
      100: Color(0xFFFE4E2D), //20%
      200: Color(0xFFFE4E2D), //30%
      300: Color(0xFFFE4E2D), //40%
      400: Color(0xFFFE4E2D), //50%
      500: Color(0xFFFE4E2D), //60%
      600: Color(0xFFFE4E2D), //70%
      700: Color(0xFFFE4E2D), //80%
      800: Color(0xFFFE4E2D), //90%
      900: Color(0xFFFE4E2D), //100%
    },
  );
}
