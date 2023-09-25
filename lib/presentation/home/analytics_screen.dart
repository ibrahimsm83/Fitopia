import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/presentation/resources/assets_manager.dart';
import 'package:fitopia/presentation/resources/color_manager.dart';
import 'package:fitopia/presentation/resources/styles_manager.dart';
import 'package:fitopia/presentation/resources/values_manager.dart';
import 'package:fitopia/widgets/bar_chart.dart';
import 'package:fitopia/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AnalyticsView extends StatefulWidget {
  const AnalyticsView({super.key});

  @override
  State<AnalyticsView> createState() => _AnalyticsViewState();
}

class _AnalyticsViewState extends State<AnalyticsView> {
  static List myProgress = [
    ImageAssets.myProgressImg1,
    ImageAssets.myProgressImg2,
    ImageAssets.myProgressImg3,
    ImageAssets.myProgressImg1,
    ImageAssets.myProgressImg2,
    ImageAssets.myProgressImg3,
    ImageAssets.workoutImage1,
  ];
  static List<String> myProgressText = <String>[
    "10 Days ago",
    "20 Days ago",
    "40 Days ago",
    "60 Days ago",
    "80 Days ago",
    "100 Days ago",
    "120 Days ago",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50.vs),
          rowTextButton("My Analytics", "Add Measurements"),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Weight",
                        style: getboldStyle(
                            color: ColorManager.secondryTwo, fontSize: 10.mv)),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: 2,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: ColorManager.secondryTwo),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 5.0),
                  child: Text("Steps",
                      style: getRegularStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color!,
                          fontSize: 10.mv)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 5.0),
                  child: Text("Neck",
                      style: getRegularStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color!,
                          fontSize: 10.mv)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 5.0),
                  child: Text("Waist",
                      style: getRegularStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color!,
                          fontSize: 10.mv)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 5.0),
                  child: Text("Hips",
                      style: getRegularStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color!,
                          fontSize: 10.mv)),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 0.0),
                //   child: InkWell(
                //       // onTap: onTapfiltericon,
                //       child: CircleAvatar(
                //     foregroundColor: ColorManager.greyColor,
                //     backgroundColor: ColorManager.greyBorderColor,
                //     radius: 10,
                //     child: Center(
                //         child: Icon(
                //       Icons.add,
                //       color: Colors.grey.shade800,
                //       size: 12,
                //     )),
                //   )),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: linegraph(),
          ),
          SizedBox(height: 10),
          rowTextButton("My Progress", "Upload Progress Pic"),
          SizedBox(height: 10),
          myProgressWiget(),
          SizedBox(height: 10.vs),
          button(
              text: "Export My Data", //AppStrings.login,
              color: ColorManager.secondryTwo,
              onTap: () {
                // Navigator.pushReplacementNamed(
                //     context, Routes.Onboarding1Route);
              }),
          SizedBox(height: 1.vs),
        ],
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

  Widget myProgressWiget() {
    return SizedBox(
      height: 200.0,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 5.0),
          scrollDirection: Axis.horizontal,
          itemCount: myProgress.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 10.0 : 0.0),
                child: userhorizanlList(
                    imagePath: myProgress[index], name: myProgressText[index]),
              )),
    );
  }

  Widget userhorizanlList({String? imagePath, String? name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imagePath!),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Text(name!,
            // textAlign: TextAlign.center,
            style: getRegularStyle(
                color: ColorManager.blackColor, fontSize: AppSize.s10.mv)),
      ],
    );
  }

  Widget rowTextButton(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1,
              style: getboldStyle(
                  color: ColorManager.blackColor, fontSize: 14.px)),
          Container(
            decoration: BoxDecoration(
              color: ColorManager.secondryTwo,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text(text2,
                  style: getRegularStyle(color: ColorManager.whiteColor)),
            ),
          )
        ],
      ),
    );
  }

  Widget linegraph() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.greyBoxColor,
            // border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            Container(
              height: 300,
              // child: Padding(
              //   padding: const EdgeInsets.only(
              //       bottom: 30.0, left: 8.0, right: 8.0, top: 8.0),
              child: BarChartSample2(),

              // LineChartSample7(
              //   betweenColor: Colors.transparent,
              //   line2Color: Colors.transparent,
              //   line1Color: ColorManager.graphLineColor,
              // ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
