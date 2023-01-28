import 'package:fitopia/model/onboarding_model.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/presentation/resources/index_manager.dart';
import 'package:fitopia/widgets/custome_button.dart';
import 'package:fitopia/widgets/toggle_buttons_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding1View extends StatefulWidget {
  const Onboarding1View({super.key});

  @override
  State<Onboarding1View> createState() => _Onboarding1ViewState();
}

class _Onboarding1ViewState extends State<Onboarding1View> {

  int selectedIndex = 0;
 List<onBoradingModel>? _chellengesList = [
    onBoradingModel(
        title: AppStrings.loseWeight,
        description: AppStrings.getLeanerImproveFitness),
    onBoradingModel(
        title: AppStrings.Leanbulk,
        description: AppStrings.buildYourStrengthMuscles),
    onBoradingModel(
        title: AppStrings.Gainweight,
        description: AppStrings.eatTrainOptimumHealth),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.vs),
            statusBar(),
            //loginImage
            SizedBox(height: AppSize.s28.vs),
            SvgPicture.asset(
              ImageAssets.onboarding1,
            ),
            SizedBox(height: AppSize.s28.vs),
            Text(
              AppStrings.whatsyourgoal,
              style: getboldStyle(
                  color: ColorManager.blackColor, fontSize: AppSize.s20.mv),
            ),
            SizedBox(height: AppSize.s28.vs),
            // customeCheckBoxButton(),
            // customeCheckBoxButton(),
            // customeCheckBoxButton1(),
            FixedTogglesButtonsList(
              selected: selectedIndex,
              callback: (int index) {
                setState(() {
                  selectedIndex = index;
                });
                //pageController.jumpToPage(index);
              },
              name: _chellengesList,
            ),
            Spacer(),
            // CustomRadioButton(
            //   horizontal: true,
            //   unSelectedColor: ColorManager.greyBorderColor,
            //   buttonLables: ['Student', 'Parent', 'Teacher', 'hgfh', 'jhgiugx'],
            //   buttonValues: ["STUDENT", "PARENT", "TEACHER", 'hgfh', 'jhgiugx'],
            //   defaultSelected: "STUDENT",
            //   radioButtonValue: (value) {
            //     print(value);
            //   },
            //   selectedColor: ColorManager.secondry,
            // ),
            button(
                text: AppStrings.next,
                color: ColorManager.primary,
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, Routes.Onboarding1Route);
                }),
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

  Widget customeCheckBoxButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          tileColor: ColorManager.secondry,
          leading: CircleAvatar(
            backgroundColor: ColorManager.greyBorderColor,
          ),
          title: Text(
            AppStrings.loseWeight,
            style: getboldStyle(color: ColorManager.whiteColor),
          ),
          subtitle: Text(
            AppStrings.getLeanerImproveFitness,
            style: getboldStyle(color: ColorManager.whiteColor),
          )),
    );
  }

  Widget customeCheckBoxButton1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          tileColor: ColorManager.greyBorderColor,
          leading: CircleAvatar(
            backgroundColor: ColorManager.secondry,
          ),
          title: Text(
            AppStrings.loseWeight,
            style: getboldStyle(color: ColorManager.blackColor),
          ),
          subtitle: Text(
            AppStrings.getLeanerImproveFitness,
            style: getboldStyle(color: ColorManager.blackColor),
          )),
    );
  }

  Widget statusBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              height: 10,
              // width: 50,
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
              // width: 50,
              decoration: BoxDecoration(
                color: ColorManager.greyColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              height: 10,
              // width: 50,
              decoration: BoxDecoration(
                color: ColorManager.greyColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              height: 10,
              // width: 50,
              decoration: BoxDecoration(
                color: ColorManager.greyColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );

    // SizedBox(
    //   height: 15,
    //   child: ListView.separated(
    //     separatorBuilder: (context, index) => SizedBox(width: 10.0),
    //     scrollDirection: Axis.horizontal,
    //     itemCount: 4,
    //     itemBuilder: ((context, index) =>

    //         ),
    //   ),
    // );
  }
}
