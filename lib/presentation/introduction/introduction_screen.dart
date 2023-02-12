import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/translations/locale_keys.g.dart';
import 'package:fitopia/widgets/custome_button.dart';
import 'package:fitopia/widgets/introduction_screen.dart';
import 'package:flutter/material.dart';
import '../resources/index_manager.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  late int selectedPage;
  late final PageController _pageController;
  bool rememberMe = false;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage.toInt());
    super.initState();
  }

  final pageCount = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (page) {
                setState(() {
                  selectedPage = page;
                });
              },
              children: [
                IndroductionPage(
                  imagepath: ImageAssets.w1Image,
                  title: LocaleKeys.w1Title.tr(), //AppStrings.w1Title,
                  description:
                      LocaleKeys.w1Description.tr(), //AppStrings.w1Description,
                ),
                IndroductionPage(
                  imagepath: ImageAssets.w2Image,
                  title: LocaleKeys.w2Title.tr(), //AppStrings.w2Title,
                  description:
                      LocaleKeys.w2Description.tr(), //AppStrings.w2Description,
                ),
                IndroductionPage(
                  imagepath: ImageAssets.w3Image,
                  title: LocaleKeys.w3Title.tr(),
                  description: LocaleKeys.w3Description.tr(),
                ),
                IndroductionPage(
                  imagepath: ImageAssets.w4Image,
                  title: LocaleKeys.w4Title.tr(),
                  description: LocaleKeys.w4Description.tr(),
                ),
              ]),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DotsIndicator(
                    dotsCount: pageCount,
                    position: selectedPage.toDouble(),
                    decorator: DotsDecorator(
                      size: Size.square(11.0),
                      color: Colors.grey, // Inactive color
                      activeColor: ColorManager.primary,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  button(
                      text: LocaleKeys.start7dayFreeTrail
                          .tr(), //AppStrings.start7dayFreeTrail,
                      color: ColorManager.primary,
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.LanguageSelectPageRoute);
                        //  Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (BuildContext context) =>
                        //               const LanguagePage()));
                      }),
                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: ElevatedButton(
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: ColorManager.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             const LanguagePage()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: ColorManager.whiteColor,
                            textStyle: const TextStyle(
                              fontSize: 14,
                            ),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: ElevatedButton(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: ColorManager.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                          onPressed: () {
                            if (selectedPage == 4) {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (BuildContext context) =>
                              //             const LanguagePage()));
                            }
                            _pageController.nextPage(
                                duration: Duration(microseconds: 1000),
                                curve: Curves.decelerate);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: ColorManager.primary,
                            textStyle: const TextStyle(
                              fontSize: 14,
                            ),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                */
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget button({
    Function()? onTap,
    String? text,
    Color? color,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.06, vertical: 10.0),
      child: CustomeButton(
          color: color!,
          text: text ?? "",
          style: getmediumStyle(
            color: ColorManager.whiteColor,
            fontSize: AppSize.s12.mv,
          ),
          onTap: onTap),
    );
  }
}

/*  icon: SvgPicture.asset(
                  "$iconpath/Location.svg",
                  color: _currentSelected == 4 ? primaryColor : Colors.grey,
                  height: 30,
                  width: 30,
                ), */