import 'package:easy_localization/easy_localization.dart';
import 'package:fitopia/model/onboarding_model.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/translations/locale_keys.g.dart';
import 'package:fitopia/widgets/multiselect_widget.dart';
import 'package:fitopia/presentation/resources/index_manager.dart';
import 'package:fitopia/widgets/custome_button.dart';
import 'package:fitopia/widgets/multiselection_checkbox.dart';
import 'package:fitopia/widgets/text_form_field.dart';
import 'package:fitopia/widgets/toggle_buttons_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:info_popup/info_popup.dart';
import 'package:numberpicker/numberpicker.dart';

class Onboarding1View extends StatefulWidget {
  const Onboarding1View({super.key});

  @override
  State<Onboarding1View> createState() => _Onboarding1ViewState();
}

class _Onboarding1ViewState extends State<Onboarding1View> {
  List<onBoradingModel>? selectedList;

  int selectedIndex = 0;
  int currentPage = 0;
  int _currentValue = 176;

  List<bool> isStatusBarActive = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> _selections = List.generate(2, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(alignment: Alignment.topCenter, child: statusBar()),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SvgPicture.asset(
                currentPage == 0
                    ? OnboardingImgTitle[0].imagePath!
                    : currentPage == 1
                        ? OnboardingImgTitle[1].imagePath!
                        : currentPage == 2
                            ? OnboardingImgTitle[2].imagePath!
                            : OnboardingImgTitle[3].imagePath!,
                height: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Text(
                // AppStrings.whatsyourgoal,
                currentPage == 0
                    ? OnboardingImgTitle[0].title!
                    : currentPage == 1
                        ? OnboardingImgTitle[1].title!
                        : currentPage == 2
                            ? OnboardingImgTitle[2].title!
                            : currentPage == 3
                                ? OnboardingImgTitle[3].title!
                                : currentPage == 4
                                    ? OnboardingImgTitle[4].title!
                                    : currentPage == 5
                                        ? OnboardingImgTitle[5].title!
                                        : currentPage == 6
                                            ? OnboardingImgTitle[6].title!
                                            : currentPage == 7
                                                ? OnboardingImgTitle[7].title!
                                                : OnboardingImgTitle[8].title!,
                style: getboldStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color!,
                    fontSize: AppSize.s20.mv),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: SizedBox(
                  child: currentPage == 0
                      ? onboarding1Widget()
                      : currentPage == 1
                          ? onboarding2Widget(DietryRequirmentList)
                          : currentPage == 2
                              ? onboarding3Widget(HowActiveAreYouList)
                              : currentPage == 3
                                  ? onboarding4Widget(genderList, true)
                                  : currentPage == 4
                                      ? onboarding4Widget(
                                          maleSpecificPlanList, false)
                                      : currentPage == 5
                                          ? HowOldAreYou()
                                          : currentPage == 6
                                              ? whereDoYouLive()
                                              : currentPage == 7
                                                  ? howMuchDoYouWeight()
                                                  : SimpleGroupCheckBoxed()),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: button(
                  text: LocaleKeys.next.tr(),
                  color: ColorManager.primary,
                  onTap: () {
                    print("${currentPage}");
                    setState(() {
                      if (currentPage == 0) {
                        isStatusBarActive[1] = true;
                        currentPage = 1;
                      } else if (currentPage == 1) {
                        isStatusBarActive[2] = true;
                        currentPage = 2;
                      } else if (currentPage == 2) {
                        isStatusBarActive[3] = true;
                        currentPage = 3;
                      } else if (currentPage == 3) {
                        currentPage = 4;
                        isStatusBarActive[4] = true;
                      } else if (currentPage == 4) {
                        currentPage = 5;
                        isStatusBarActive[5] = true;
                      } else if (currentPage == 5) {
                        currentPage = 6;
                        isStatusBarActive[6] = true;
                      } else if (currentPage == 6) {
                        currentPage = 7;
                        isStatusBarActive[7] = true;
                      } else if (currentPage == 7) {
                        currentPage = 8;
                        isStatusBarActive[8] = true;
                      } else {
                        Navigator.pushReplacementNamed(
                            context, Routes.HomePageRoute);
                        //  currentPage = 0;
                        // isStatusBarActive[0] = true;
                        // isStatusBarActive[1] = false;
                        // isStatusBarActive[2] = false;
                        // isStatusBarActive[3] = false;
                        // isStatusBarActive[4] = false;
                        // isStatusBarActive[5] = false;
                        // isStatusBarActive[6] = false;
                        // isStatusBarActive[7] = false;
                        // isStatusBarActive[8] = false;
                      }
                    });
                  }),
            ),
            SizedBox(height: AppSize.s28.vs),
          ],
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

  Widget onboarding2Widget(List<onBoradingModel>? itemList) {
    return FixedTogglesButtonsList(
      selected: selectedIndex,
      callback: (int index) {
        setState(() {
          selectedIndex = index;
        });
      },
      name: itemList,
    );
  }

  Widget onboarding3Widget(List<onBoradingModel>? itemList) {
    return FixedTogglesButtonsList(
      selected: selectedIndex,
      callback: (int index) {
        setState(() {
          selectedIndex = index;
        });
      },
      name: itemList,
    );
  }

  Widget onboarding1Widget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
          itemCount: goalList!.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GridItem(
                item: goalList![index],
                isSelected: (bool value) {
                  setState(() {
                    if (value) {
                      selectedList?.add(goalList![index]);
                    } else {
                      selectedList?.remove(goalList![index]);
                    }
                  });
                  print("$index : $value");
                },
                key: Key(goalList![index].id.toString()));
          }),
    );
  }

  Widget statusBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
        9,
        (index) => Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: isStatusBarActive[index]
                    ? ColorManager.primary
                    : ColorManager.greyColor, //ColorManager.primary,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
      )

          /* [
          Flexible(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: isStatusBarActive[1]
                    ? ColorManager.primary
                    : ColorManager.greyColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: isStatusBarActive[2]
                    ? ColorManager.primary
                    : ColorManager.greyColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: isStatusBarActive[3]
                    ? ColorManager.primary
                    : ColorManager.greyColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: isStatusBarActive[4]
                    ? ColorManager.primary
                    : ColorManager.greyColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: isStatusBarActive[5]
                    ? ColorManager.primary
                    : ColorManager.greyColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: isStatusBarActive[6]
                    ? ColorManager.primary
                    : ColorManager.greyColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: isStatusBarActive[7]
                    ? ColorManager.primary
                    : ColorManager.greyColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],*/
          ),
    );
  }

  Widget onboarding4Widget(List<onBoradingModel>? itemList, bool? isInfoIcon) {
    return Column(
      children: [
        FixedTogglesButtonsList(
          selected: selectedIndex,
          callback: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          name: itemList,
        ),
        Visibility(
          visible: isInfoIcon ?? false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoPopupWidget(
                    arrowTheme: InfoPopupArrowTheme(
                      color: ColorManager.secondry,
                      arrowDirection: ArrowDirection.down,
                    ),
                    contentTheme: InfoPopupContentTheme(
                      infoContainerBackgroundColor: ColorManager.greyBoxColor,
                      infoTextStyle:
                          getRegularStyle(color: ColorManager.blackColor),
                      contentPadding: const EdgeInsets.all(8),
                      contentBorderRadius:
                          BorderRadius.all(Radius.circular(10)),
                      infoTextAlign: TextAlign.center,
                    ),
                    contentTitle:
                        '''My gender identity is non-binary, transgender, or gender non-conforming. Which sex do I choose?
Your metabolic equation is used to calculate your calorie requirements; there are different formulae for men and women depending on your sex. Choose your sex assigned at birth since it will most correctly reflect your metabolic rate if your gender identification and your sex given at birth are not the same and you have not started taking gender-affirming drugs. Ask your doctor what the best option for you might be if you have started taking gender-affirming drugs. If you have only recently started taking your meds, you may want to choose the sex that was assigned to you at birth and then update when you are further along in your medical transition. Your metabolism may be more in line with your gender identity after you've been taking your meds for more than a few months, especially as your muscle and fat mass begin to change.
Please visit a physician for the best outcomes.''',
                    child: Icon(
                      Icons.info,
                      color: ColorManager.primary,
                    )),
                SizedBox(width: 10.0),
                Text(
                  "Which one should I choose",
                  style: getmediumStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color!),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget HowOldAreYou() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'DD',
                      filled: true,
                      fillColor: ColorManager.greylightColor),
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'MM',
                    filled: true,
                    fillColor: ColorManager.greylightColor),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'YYYY',
                    filled: true,
                    fillColor: ColorManager.greylightColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget whereDoYouLive() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomeTextFormField(
          hintText: LocaleKeys.City.tr(),
          //AppStrings.enterYourEmail,
          fillColor: ColorManager.greylightColor,
          validator: (String? val) {
            //   if (val == null || val.isEmpty) {
            //     return AppStrings.enterYourEmail;
            //   }
            //   return null;
          },
        ),
        SizedBox(height: 20),
        CustomeTextFormField(
          hintText: LocaleKeys.Country.tr(),
          //AppStrings.enterYourEmail,
          fillColor: ColorManager.greylightColor,
          validator: (String? val) {
            //   if (val == null || val.isEmpty) {
            //     return AppStrings.enterYourEmail;
            //   }
            //   return null;
          },
        ),
      ],
    );
  }

  Widget howMuchDoYouWeight() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        NumberPicker(
          itemCount: 6,
          value: _currentValue,
          axis: Axis.horizontal,
          minValue: 173,
          maxValue: 178,
          textStyle: getmediumStyle(
              color: Theme.of(context).textTheme.bodyText1!.color!),
          selectedTextStyle: TextStyle(
              fontSize: 35,
              color: ColorManager.secondry,
              fontWeight: FontWeight.bold),
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Current Weight: $_currentValue',
            style: getmediumStyle(
                color: Theme.of(context).textTheme.bodyText1!.color!),
          ),
        ),
        SizedBox(height: 30.0),
        ToggleButtons(
          borderRadius: BorderRadius.circular(30),
          borderColor: Theme.of(context).textTheme.bodyText1!.color!,
          //selectedColor: ColorManager.secondry,
          fillColor: ColorManager.secondry,

          textStyle:
              TextStyle(color: Theme.of(context).textTheme.bodyText1!.color!),
          children: <Widget>[
            // Icon(Icons.add_comment),
            Text(
              "LBS",
              style: getmediumStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color!),
            ), // Icon(Icons.airline_seat_individual_suite),
            Text(
              "KG",
              style: getmediumStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color!),
            ), //Icon(Icons.add_location),
          ],
          isSelected: _selections,
          onPressed: (int index) {
            setState(() {
              _selections[index] = !_selections[index];
            });
          },
        )
      ],
    );
  }

  Widget SimpleGroupCheckBoxed() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: wheredidyouHearList!.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return MultiSelectionCheckBox(
                item: wheredidyouHearList![index],
                isSelected: (bool value) {
                  setState(() {
                    if (value) {
                      selectedList?.add(wheredidyouHearList![index]);
                    } else {
                      selectedList?.remove(wheredidyouHearList![index]);
                    }
                  });
                  // print("$index : $value");
                },
                key: Key(wheredidyouHearList![index].id.toString()));
          }),
    );
    //Divider(),
  }
}
