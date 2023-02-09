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


import '../resources/index_manager.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
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
                  LocaleKeys.forgotyourPassword.tr(),
                  //AppStrings.forgotyourPassword,
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
                  padding:
                      const EdgeInsets.only(left: 30.0, bottom: 0.0, top: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      LocaleKeys.forgotPasswordDes.tr(),
                      //AppStrings.forgotPasswordDes,
                      textAlign: TextAlign.left,
                      style: getboldStyle(
                          color: ColorManager.greyBorderColor,
                          fontSize: AppSize.s13.mv),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s15.vs),
                CustomeTextFormField(
                  hintText: LocaleKeys.enterYourEmail.tr(),
                  //AppStrings.enterYourEmail,
                  // fillColor: ColorManager.primarydarkColor,
                  validator: (String? val) {
                    //   if (val == null || val.isEmpty) {
                    //     return AppStrings.enterYourEmail;
                    //   }
                    //   return null;
                  },
                ),

                SizedBox(height: 10.vs),
                button(
                  text: LocaleKeys.SENDCODE.tr(), //AppStrings.SENDCODE,
                  color: ColorManager.primary,
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.OtpVerificationRoute),
                ),
                SizedBox(height: 2.vs),

                textspan(
                  text1: LocaleKeys.dontHaveAnAccount
                      .tr(), //AppStrings.dontHaveAnAccount,
                  text2: LocaleKeys.signUp.tr(), //AppStrings.signUp,
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
