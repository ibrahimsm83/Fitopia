import 'package:easy_localization/easy_localization.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/translations/locale_keys.g.dart';
import 'package:fitopia/widgets/app_logo_widget.dart';
import 'package:fitopia/widgets/background_image_widget.dart';
import 'package:fitopia/widgets/custome_button.dart';
import 'package:fitopia/widgets/text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../resources/index_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: AppSize.s80.vs),
                AppLogoView(),
                SizedBox(height: AppSize.s20.vs),
                Text(
                  LocaleKeys.welcomeToFitopia.tr(),
                  // AppStrings.welcomeToFitopia,
                  style: getboldStyle(
                      color: ColorManager.blackColor, fontSize: AppSize.s20.mv),
                ),
                //loginImage
                SizedBox(height: AppSize.s20.vs),
                SvgPicture.asset(
                  ImageAssets.loginImage,
                ),
                SizedBox(height: AppSize.s28.vs),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    // AppStrings.enterEmailAndPassword,
                    LocaleKeys.enterEmailAndPassword.tr(),
                    textAlign: TextAlign.center,
                    style: getmediumStyle(
                        color: ColorManager.greyBorderColor,
                        fontSize: AppSize.s13.mv),
                  ),
                ),
                SizedBox(height: AppSize.s28.vs),
                CustomeTextFormField(
                  hintText: LocaleKeys.enterYourEmail.tr(),
                  // fillColor: ColorManager.primarydarkColor,
                  validator: (String? val) {
                    //   if (val == null || val.isEmpty) {
                    //     return AppStrings.enterYourEmail;
                    //   }
                    //   return null;
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: AppSize.sizeWidth(context) * 0.08,
                        bottom: AppSize.s10,
                        top: AppSize.s10.vs),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.forgotPasswordRoute);
                      },
                      child: Text(
                        LocaleKeys.forgotPassword.tr(),
                        // AppStrings.forgotPassword,
                        style: getmediumStyle(
                            color: ColorManager.primary,
                            fontSize: AppSize.s12.mv),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.vs),
                CustomeTextFormField(
                  obscureText: true,
                  hintText: LocaleKeys.enterYourPassword
                      .tr(), // AppStrings.enterYourPassword,
                  //fillColor: ColorManager.primarydarkColor,
                  validator: (String? val) {
                    // if (val == null || val.isEmpty) {
                    //   return AppStrings.enterYourPassword;
                    // }
                    // return null;
                  },
                ),
                SizedBox(height: 10.vs),
                button(
                    text: LocaleKeys.login.tr(), //AppStrings.login,
                    color: ColorManager.primary,
                    onTap: () {
                    
                      Navigator.pushReplacementNamed(
                          context, Routes.subscriptionViewPageRoute);
                     
                    }),
                SizedBox(height: 1.vs),
                textspan(
                  text1: LocaleKeys.dontHaveAnAccount
                      .tr(), //AppStrings.dontHaveAnAccount,
                  text2: LocaleKeys.signUp.tr(), //AppStrings.signUp,
                  onTap: () {
                    // Navigator.pushReplacementNamed(
                    //     context, Routes.signUp1Route);
                  },
                  //  Navigator.pushReplacementNamed(
                  //     context, Routes.loginWithSocialMediaRoute),
                ),
                SizedBox(height: 1.vs)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget TermAndCondition() {
    return Padding(
      padding: EdgeInsets.only(left: AppSize.sizeWidth(context) * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            child: Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: rememberMe,
              activeColor: ColorManager.primary,
              onChanged: (value) => setState(
                () => rememberMe = value!,
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              text: "I agree with your",
              style: TextStyle(color: Colors.black, fontSize: 16.sp),
              children: <TextSpan>[
                TextSpan(
                  text: " Term & Condition",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                      fontSize: 16.sp),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //     const LoginScreen(),
                      //   ),
                      // );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please Accept Terms and conditions")));
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
    //SizedBox(height: 10.0),
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

  Widget textspan(
      {String? text1,
      String? text2,
      BuildContext? context,
      Function()? onTap}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p14, vertical: AppPadding.p20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: text1,
          style: getRegularStyle(
              color: ColorManager.blackColor, fontSize: AppSize.s12.mv),
          children: <TextSpan>[
            TextSpan(
                text: text2,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: ColorManager.primary,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.bold,
                    fontSize: AppSize.s12.mv),
                recognizer: TapGestureRecognizer()..onTap = onTap)
          ],
        ),
      ),
    );
  }
}
