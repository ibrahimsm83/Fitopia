import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/translations/locale_keys.g.dart';
import 'package:fitopia/widgets/app_logo_widget.dart';
import 'package:fitopia/widgets/background_image_widget.dart';
import 'package:fitopia/widgets/custome_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../resources/index_manager.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();

    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    //viewmodel.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BackgroundImage(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: AppSize.s50.vs),
                AppLogoView(),
                SizedBox(height: AppSize.s20.vs),
                Text(
                  LocaleKeys.forgotyourPassword.tr(),
                  textAlign: TextAlign.center,
                  style: getmediumStyle(
                      color: ColorManager.blackColor, fontSize: AppSize.s20.mv),
                ),

                //SizedBox(height: 4.h),
                SizedBox(height: AppSize.sizeHeight(context) * 0.04),
                Padding(
                  padding: const EdgeInsets.only(left: AppSize.s12),
                  child: Text(
                    LocaleKeys.enter6digitcode.tr(),

                    //textAlign: TextAlign.center,
                    style: getmediumStyle(
                        color: ColorManager.greyColor,
                        fontSize: AppSize.s14.mv),
                  ),
                ),
                PinCodeTextField(
                  appContext: context,
                  hintCharacter: '0',
                  pastedTextStyle:
                      getRegularStyle(color: ColorManager.blackColor),
                  length: 6,
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length <= 5) {
                      hasError = true;
                    } else {
                      hasError = false;
                    }
                    return null;
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    selectedColor: ColorManager.greyColor,
                    activeColor: ColorManager.greyColor,
                    inactiveColor: ColorManager.greyColor,
                    activeFillColor: ColorManager.greyColor,
                    fieldWidth: 48,
                    fieldOuterPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  //cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  // enableActiveFill: true,
                  cursorColor: ColorManager.primary,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  textStyle: TextStyle(color: ColorManager.blackColor),
                  //scrollPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {},
                  onChanged: (value) {
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),

                SizedBox(height: 30.vs),
                GestureDetector(
                  onTap: (() => Navigator.of(context).pop()),
                  child: Text(
                    LocaleKeys.resendCode.tr(),
                    textAlign: TextAlign.center,
                    style: getboldStyle(
                        color: ColorManager.primary, fontSize: AppSize.s13.mv),
                  ),
                ),
                SizedBox(height: 30.vs),
                button(
                    text: LocaleKeys.next.tr(),
                    color: ColorManager.primary,
                    onTap: () {
                      if (currentText.length == 6) {
                        Navigator.pushNamed(
                            context, Routes.ChangePasswordViewRoute);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please Enter Otp"),
                          duration: Duration(milliseconds: 1000),
                        ));
                      }
                    }),
                SizedBox(height: 2.vs),

                textspan(
                    text1: LocaleKeys.dontHaveAnAccount.tr(),
                    text2: LocaleKeys.signUp.tr(),
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.signUp1Route),
                    context: context),
                // Padding(
                //   padding:
                //       EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.0),
                //   child: CustomeButton(
                //       text: AppConstant.next,
                //       onTap: () {
                //         if (currentText.length == 6) {
                //           AppNavigation.navigateTo(context, '/CreatePassword');
                //         } else {
                //           // CustomSnacksBar.showSnackBar(
                //           //     context, AppConstant.otpValidator);
                //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //             content: Text(AppConstant.otpValidator),
                //             duration: Duration(milliseconds: 1000),
                //           ));
                //         }
                //       }),
                // ),
              ],
            ),
          ),
        ),
      );
  Widget button({Function()? onTap, String? text, Color? color}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.06, vertical: 10.0),
      child: CustomeButton(
          color: color!,
          text: text ?? "",
          style: getboldStyle(color: ColorManager.whiteColor),
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
          style: getmediumStyle(
              color: ColorManager.blackColor, fontSize: AppSize.s12.mv),
          children: <TextSpan>[
            TextSpan(
                text: text2,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: ColorManager.primary,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.medium,
                    fontSize: AppSize.s12.mv),
                recognizer: TapGestureRecognizer()..onTap = onTap)
          ],
        ),
      ),
    );
  }
}
