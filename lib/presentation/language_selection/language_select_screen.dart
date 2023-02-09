import 'package:easy_localization/easy_localization.dart';
import 'package:fitopia/bloc/theme_bloc.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/presentation/resources/index_manager.dart';
import 'package:fitopia/widgets/app_logo_widget.dart';
import 'package:fitopia/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../translations/locale_keys.g.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  // The inital group value
  String _selectedLanguage = 'en';
  bool isChanged = false;

  _lightTheme(context) {
    BlocProvider.of<ChangeThemeBloc>(context).add(LightThemeEvent());
  }

  _darckTheme(context) {
    BlocProvider.of<ChangeThemeBloc>(context).add(DarkThemeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.grey),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppSize.s20.vs),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.brightness_4,
                      color: Colors.red,
                    ),
                    tooltip: 'Theme selector',
                    onPressed: () {
                      setState(() {
                        !isChanged
                            ? _lightTheme(context)
                            : _darckTheme(context);
                        isChanged = !isChanged;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: AppSize.s20.vs),
              AppLogoView(),
              SizedBox(height: AppSize.s20.vs),
              Text(
                LocaleKeys.welcomeToFitopia.tr(),
                style: getboldStyle(
                    color: ColorManager.blackColor, fontSize: AppSize.s20.mv),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  LocaleKeys.Language.tr(),
                  style: getmediumStyle(
                      color: ColorManager.blackColor, fontSize: AppSize.s18.mv),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 0.3,
                color: ColorManager.blackColor,
              ),
              ListTile(
                trailing: Radio<String>(
                  value: 'en',
                  activeColor: Colors.red,
                  groupValue: _selectedLanguage,
                  onChanged: (value) async {
                    await context.setLocale(Locale('en'));
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
                title: Text(
                  "English",
                  //LocaleKeys.English_US.tr(),
                  style: getmediumStyle(
                      color: ColorManager.blackColor, fontSize: AppSize.s13.mv),
                ),
              ),
              ListTile(
                trailing: Radio<String>(
                  value: 'ar',
                  activeColor: Colors.red,
                  groupValue: _selectedLanguage,
                  onChanged: (value) async {
                    await context.setLocale(Locale('ar'));
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
                title: Text(
                  LocaleKeys.arabic.tr(),
                  style: getmediumStyle(
                      color: ColorManager.blackColor, fontSize: AppSize.s13.mv),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: button(
                    text: LocaleKeys.next.tr(),
                    color: ColorManager.primary,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.Onboarding1Route);
                    }),
                /* Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                      colors: [
                        Color(0xFFe2593a),
                        Color(0xFFF52761),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.loginRoute);
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     // MaterialPageRoute(builder: (context) => LanguagePage()),
                      //    // MaterialPageRoute(builder: (context) => MainScreen()),
                      //     MaterialPageRoute(builder: (context) => InvitationMainPage()),
                      //     (Route<dynamic> route) => false);
                    },
                    child: Text(
                      LocaleKeys.next.tr(),
                      style: TextStyle(
                        color: ColorManager.whiteColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),*/
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button({Function()? onTap, String? text, Color? color}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.06, vertical: 10.0),
      child: CustomeButton(
          color: color!,
          text: text ?? "",
          style: getboldStyle(
            color: ColorManager.whiteColor,
            fontSize: AppSize.s12.mv,
          ),
          onTap: onTap),
    );
  }
}
