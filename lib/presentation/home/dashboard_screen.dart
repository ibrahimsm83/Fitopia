import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fitopia/model/deshboard_model.dart';
import 'package:fitopia/model/products_model.dart';
import 'package:fitopia/translations/locale_keys.g.dart';
import 'package:fitopia/widgets/line_cahrt_sample7.dart';
import 'package:fitopia/widgets/products_card_widgets.dart';
import 'package:fitopia/widgets/toggle_buttons_vertical.dart';
import 'package:fitopia/widgets/week_days_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../resources/index_manager.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final PageController _controller = PageController(initialPage: 0);
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 30.vs),
      UserNotification(),
      //SizedBox(height: 15.0),
      linegraph(),

      weekdaysWidget(weekDaysList),
      //progressbar(),
      //dotIndicator(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Today's Workout",
            //LocaleKeys.Products.tr(),
            style: getboldStyle(
                color: Theme.of(context).textTheme.bodyText1!.color!,
                fontSize: 16.mv)),
      ),
      todayWorkout(),
      SizedBox(height: 15.0),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text("Today's Meals",
            //LocaleKeys.Products.tr(),
            style: getboldStyle(
                color: Theme.of(context).textTheme.bodyText1!.color!,
                fontSize: 16.mv)),
      ),

      todayMeals(),
      SizedBox(height: 10.0),
      SizedBox(
        height: 30.h,
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          children: List.generate(
            4,
            ((index) {
              return index == 0
                  ? calories()
                  : index == 1
                      ? Macros()
                      : index == 2
                          ? progressbar(
                              LocaleKeys.LowCarb.tr(),
                              LocaleKeys.Carbohydrates.tr(),
                              "60/260g",
                              LocaleKeys.Sugar.tr(),
                              "55/260g",
                              LocaleKeys.Fiber.tr(),
                              "25/38g")
                          : index == 3
                              ? progressbar("Heart Healthy", "Fat", "0/68g",
                                  "Sodium", "0/2300mg", "Choesterol", "0/300mg")
                              : SizedBox();
            }),
          ),
        ),
      ),

      // dotIndicator(),
      dotIndicatorWidget(),

      //ProducsWidget(),
      //dotIndicator1(),

      SizedBox(height: 30.0),
    ]));
  }

  Widget todayWorkout() {
    return ProductCardWidget(
      index: 0,
      title: "Self-Guided",
      subtile: "Muscle building: High-powered legs",
      des: "50 Min,  Glutes, Legs, Lower body",
      imagepath: ImageAssets.workoutImage1,
    );
  }

  Widget todayMeals() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: ListView.builder(
        // scrollDirection: Axis.vertical,
        itemCount: mealsList!.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ProductCardWidget(
            index: index,
            title: mealsList![index].title ?? "",
            subtile: mealsList![index].subtitle ?? "",
            des: mealsList![index].description ?? "",
            imagepath: mealsList![index].ImagePath ?? "",
          );
        },
      ),
    );
  }

  Widget calories() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        child: Container(
            decoration: BoxDecoration(
                color: ColorManager.greyBoxColor,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Calories",
                      style: getboldStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color!,
                          fontSize: 16.mv)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                  child: Text("Remaining = Goal - Food + Exercise ",
                      style: getRegularStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color!,
                          fontSize: 12.mv)),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    circleWidget("2050", "Remaining", 110, 110),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          listTile(
                              ImageAssets.BaseGoalIcon, "Base Goal", "2050"),
                          listTile(ImageAssets.foodIcon, "Food", "0"),
                          listTile(ImageAssets.ExerciseIcon, "Exercise", "0"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  Widget Macros() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Macros",
                  style: getboldStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color!,
                      fontSize: 16.mv)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Carbohydrates",
                        style: getRegularStyle(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color!,
                            fontSize: 14.mv)),
                    SizedBox(height: 10.0),
                    circleWidget("0", "/256g", 100, 100),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Fat",
                        style: getRegularStyle(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color!,
                            fontSize: 14.mv)),
                    SizedBox(height: 10.0),
                    circleWidget("0", "/86g", 100, 100),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Protein",
                        style: getRegularStyle(
                            color:
                                Theme.of(context).textTheme.bodyText1!.color!,
                            fontSize: 14.mv)),
                    SizedBox(height: 10.0),
                    circleWidget("0", "/102g", 100, 100),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget circleWidget(
      String title, String subtitle, double height, double widget) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
      child: Container(
        height: height,
        width: widget,
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.greyBorderColor, width: 5.0),
            shape: BoxShape.circle),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, //"2050",
                style: getboldStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color!,
                    fontSize: 18.mv)),
            Text(subtitle, //,
                style: getRegularStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color!,
                    fontSize: 14.mv)),
          ],
        ),
      ),
    );
  }

  Widget listTile(String iconPath, String title, String subtitl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(children: [
          SvgPicture.asset(
            iconPath,
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: getboldStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color!,
                      fontSize: 12.mv)),
              Text(subtitl,
                  style: getRegularStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color!,
                      fontSize: 12.mv)),
            ],
          )
        ]),
      ),
    );
  }

  Widget weekdaysWidget(List<weekDaysModel>? itemList) {
    return WeekDaysToggleButtonsList(
      selected: selectedIndex,
      callback: (int index) {
        setState(() {
          selectedIndex = index;
        });
      },
      list: itemList,
    );
  }

  Widget UserNotification() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        children: [
          SvgPicture.asset(ImageAssets.userCircleIcon,
              color: ColorManager.greyColor),
          textspan(
            text1: "Hi ",
            text2: "Steve",
            context: context,
          ),
          Spacer(),
          SvgPicture.asset(
            ImageAssets.bellIcon,
            color: ColorManager.greyColor,
            height: 20,
            width: 20,
          ),
        ],
      ),
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
          style: getboldStyle(
              color: Theme.of(context!).textTheme.bodyText1!.color!,
              fontSize: AppSize.s14.mv),
          children: <TextSpan>[
            TextSpan(
                text: text2,
                style: TextStyle(
                    //decoration: TextDecoration.underline,
                    color: ColorManager.primary,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.bold,
                    fontSize: AppSize.s14.mv),
                recognizer: TapGestureRecognizer()..onTap = onTap)
          ],
        ),
      ),
    );
  }

  Widget dotIndicatorWidget() {
    return Align(
      alignment: Alignment.center,
      child: SmoothPageIndicator(
          controller: _controller,
          count: 4,
          // effect: SlideEffect,
          effect: SlideEffect(
            spacing: 8.0,
            radius: 10.0,
            dotWidth: 10.0,
            dotHeight: 10.0,
            paintStyle: PaintingStyle.fill,
            strokeWidth: 1.5,
            activeDotColor: ColorManager.secondry,
          )),
    );
  }

  Widget progressbar(String heading, String p1Title, String p1value,
      String p2Title, String p2value, String p3Title, String p3value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(heading, //
                  style: getboldStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color!,
                      fontSize: 16.mv)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      titleOfProgressBar(p1Title, p1value),
                      LinearPercentIndicator(
                          barRadius: const Radius.circular(20.0),
                          animation: true,
                          lineHeight: 12.0,
                          animationDuration: 2000,
                          percent: 0.2,
                          progressColor: ColorManager.secondry),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    children: [
                      titleOfProgressBar(p2Title, p2value),
                      LinearPercentIndicator(
                          barRadius: const Radius.circular(20.0),
                          animation: true,
                          lineHeight: 12.0,
                          animationDuration: 2000,
                          percent: 0.7,
                          progressColor: ColorManager.secondry),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    children: [
                      titleOfProgressBar(p3Title, p3value),
                      LinearPercentIndicator(
                          barRadius: const Radius.circular(20.0),
                          animation: true,
                          lineHeight: 12.0,
                          animationDuration: 2000,
                          percent: 0.3,
                          progressColor: ColorManager.secondry),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 10.0, vertical: 2.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: const [
                  //       Text("0", style: TextStyle(color: Colors.grey)),
                  //       Text("5", style: TextStyle(color: Colors.grey)),
                  //       Text("10", style: TextStyle(color: Colors.grey)),
                  //       Text("15", style: TextStyle(color: Colors.grey)),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget titleOfProgressBar(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: getRegularStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color!,
                  fontSize: 12.mv)),
          Text(
            subtitle,
            style: getRegularStyle(
                color: Theme.of(context).textTheme.bodyText1!.color!,
                fontSize: 12.mv),
          ),
        ],
      ),
    );
  }

/*
  Widget dotIndicator1() {
    return Align(
      alignment: Alignment.center,
      child: DotsIndicator(
        mainAxisAlignment: MainAxisAlignment.center,
        dotsCount: 2,
        position: 0.0, //selectedPage.toDouble(),
        decorator: DotsDecorator(
          size: Size.square(10.0),
          color: Colors.grey, // Inactive color
          activeColor: ColorManager.secondry,
        ),
      ),
    );
  }

  Widget listTile(String title, String subtitle) {
    return ListTile(
      title: Text(title,
          style: getboldStyle(
              color: Theme.of(context).textTheme.bodyText1!.color!,
              fontSize: 16.mv)),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          subtitle,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color!,
          ),
        ),
      ),
    );
  }

  Widget ProducsWidget() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          itemCount: HomeProductsList.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: ((context, index) => SizedBox(
                width: 10.0,
              )),
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 10 : 0.0),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorManager.whiteColor,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        HomeProductsList[index].imagePath!,
                        height: 70,
                        width: 70,
                      ),
                      SizedBox(height: 4.0),
                      Text(HomeProductsList[index].title!,
                          style: getmediumStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color!,
                              fontSize: 12.mv)),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
*/
  Widget linegraph() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15.0)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 5.0),
                        child: Text(LocaleKeys.Weight.tr(),
                            style: getboldStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!,
                                fontSize: 17.mv)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(LocaleKeys.Last90days.tr(),
                            style: getRegularStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color!,
                                fontSize: 10.mv)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 0.0),
                  child: InkWell(
                      // onTap: onTapfiltericon,
                      child: CircleAvatar(
                    foregroundColor: ColorManager.greyColor,
                    backgroundColor: ColorManager.greyBorderColor,
                    radius: 10,
                    child: Center(
                        child: Icon(
                      Icons.add,
                      color: Colors.grey.shade800,
                      size: 12,
                    )),
                  )),
                ),
              ],
            ),
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 30.0, left: 8.0, right: 8.0, top: 8.0),
                child: LineChartSample7(
                  betweenColor: Colors.transparent,
                  line2Color: Colors.transparent,
                  line1Color: ColorManager.graphLineColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
