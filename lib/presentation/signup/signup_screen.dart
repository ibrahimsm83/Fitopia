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

class SignUp1 extends StatefulWidget {
  const SignUp1({Key? key}) : super(key: key);

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  int pageno = 0;
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
                   LocaleKeys.createAnAccount.tr(),
                  //AppStrings.createAnAccount,
                  style: getboldStyle(
                      color: ColorManager.blackColor, fontSize: AppSize.s20.mv),
                ),
                //loginImage
                SizedBox(height: AppSize.s20.vs),
                SvgPicture.asset(
                  ImageAssets.loginImage,
                ),
                SizedBox(height: AppSize.s28.vs),
                pageno == 0
                    ? SignUp1Container()
                    : pageno == 1
                        ? SignUp2Container()
                        : SignUp3Container(),

                SizedBox(height: 1.vs),
                textspan(
                  text1: LocaleKeys.alreadyHaveanAccount.tr(),//AppStrings.alreadyHaveanAccount,
                  text2: LocaleKeys.signIn.tr(),//AppStrings.signIn,
                  onTap: () => Navigator.pushReplacementNamed(
                      context, Routes.loginRoute),
                ),
                SizedBox(height: 1.vs)
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///Signup1
  Widget SignUp1Container() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, bottom: 0.0, top: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
               LocaleKeys.whatsYourEmail.tr(),
              textAlign: TextAlign.left,
              style: getboldStyle(
                  color: ColorManager.blackColor, fontSize: AppSize.s13.mv),
            ),
          ),
        ),
        SizedBox(height: AppSize.s15.vs),
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
        TermAndCondition(),
        SizedBox(height: 10.vs),
        button(
            text: LocaleKeys.contine.tr(),//AppStrings.contine,
            color: ColorManager.primary,
            onTap: () {
              setState(() {
                pageno = 1;
              });
              //Navigator.pushNamed(context, Routes.signUp2Route);
            }),
      ],
    );
  }

  ///Signup2
  Widget SignUp2Container() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, bottom: 0.0, top: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
               LocaleKeys.ChoosePassword.tr(),//AppStrings.ChoosePassword,
              textAlign: TextAlign.left,
              style: getboldStyle(
                  color: ColorManager.blackColor, fontSize: AppSize.s13.mv),
            ),
          ),
        ),
        SizedBox(height: AppSize.s15.vs),
        CustomeTextFormField(
          hintText:  LocaleKeys.enterPassword.tr(),//AppStrings.enterPassword,
          obscureText: true,
          // fillColor: ColorManager.primarydarkColor,
          validator: (String? val) {
            //   if (val == null || val.isEmpty) {
            //     return AppStrings.enterYourEmail;
            //   }
            //   return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, bottom: 10.0, top: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              LocaleKeys.passwordValidation.tr(),
              textAlign: TextAlign.left,
              style: getRegularStyle(
                  color: ColorManager.greyBorderColor,
                  fontSize: AppSize.s13.mv),
            ),
          ),
        ),
        SizedBox(height: 10.vs),
        button(
            text: LocaleKeys.contine.tr(),// AppStrings.contine,
            color: ColorManager.primary,
            onTap: () {
              setState(() {
                pageno = 2;
              });
            }),
        SizedBox(height: 2.vs),
        GestureDetector(
          onTap: (() {
            setState(() {
              pageno = 0;
            });
          }),
          child: Text(
             LocaleKeys.back.tr(),//AppStrings.back,
            textAlign: TextAlign.left,
            style: getboldStyle(
                color: ColorManager.greyBorderColor, fontSize: AppSize.s13.mv),
          ),
        ),
      ],
    );
  }

  ///Signup3
  Widget SignUp3Container() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, bottom: 0.0, top: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
               LocaleKeys.WhatsYourName.tr(),//AppStrings.WhatsYourName,
              textAlign: TextAlign.left,
              style: getboldStyle(
                  color: ColorManager.blackColor, fontSize: AppSize.s13.mv),
            ),
          ),
        ),
        SizedBox(height: AppSize.s15.vs),
        CustomeTextFormField(
          hintText:  LocaleKeys.FirstName.tr(),//AppStrings.FirstName,
          validator: (String? val) {
            //   if (val == null || val.isEmpty) {
            //     return AppStrings.enterYourEmail;
            //   }
            //   return null;
          },
        ),
        SizedBox(height: AppSize.s15.vs),
        CustomeTextFormField(
          hintText: LocaleKeys.LastName.tr(),//AppStrings.LastName,
          validator: (String? val) {
            //   if (val == null || val.isEmpty) {
            //     return AppStrings.enterYourEmail;
            //   }
            //   return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 10.0, right: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: textspan(
              text1: LocaleKeys.privacyPlicy.tr(),//AppStrings.privacyPlicy,
              text2: "Privacy Policy and Terms & Conditions.",
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.loginRoute),
            ),
          ),
        ),
        SizedBox(height: 10.vs),
        button(
            text: LocaleKeys.CREATEACCOUNT.tr(),//AppStrings.CREATEACCOUNT,
            color: ColorManager.primary,
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.Onboarding1Route);
            }),
        SizedBox(height: 2.vs),
        GestureDetector(
          onTap: (() {
            setState(() {
              pageno = 1;
            });
          }),
          child: Text(
            LocaleKeys.back.tr(),//AppStrings.back,
            textAlign: TextAlign.left,
            style: getboldStyle(
                color: ColorManager.greyBorderColor, fontSize: AppSize.s13.mv),
          ),
        ),
      ],
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
              side: BorderSide(color: Color(0xff585858)),
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
              text: LocaleKeys.sendmeEmailFitopiaTeam.tr(),//AppStrings.sendmeEmailFitopiaTeam,
              style: getRegularStyle(
                  color: ColorManager
                      .blackColor), //TextStyle(color: Colors.black, fontSize: 16.sp),
              children: <TextSpan>[
                TextSpan(
                  text: "Fitopia's team",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: ColorManager.primary,
                      fontSize: 14.sp),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //     const LoginScreen(),
                      //   ),
                      // );
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: Text("Please Accept Terms and conditions")));
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
