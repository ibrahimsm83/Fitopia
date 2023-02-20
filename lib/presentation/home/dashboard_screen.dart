import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fitopia/model/products_model.dart';
import 'package:fitopia/translations/locale_keys.g.dart';
import 'package:fitopia/widgets/line_chart_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../resources/index_manager.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 30.vs),
      UserNotification(),
      progressbar(),
      dotIndicator(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(LocaleKeys.Products.tr(),
            style: getboldStyle(
                color: Theme.of(context).textTheme.bodyText1!.color!,
                fontSize: 16.mv)),
      ),
      ProducsWidget(),
      SizedBox(height: 15.0),
      linegraph(),
      dotIndicator1(),
      SizedBox(height: 10.0),
    ]));
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

  Widget progressbar() {
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
              child: Text(LocaleKeys.LowCarb.tr(),
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
                      titleOfProgressBar(
                          LocaleKeys.Carbohydrates.tr(), "60/260g"),
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
                      titleOfProgressBar(LocaleKeys.Sugar.tr(), "55/260g"),
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
                      titleOfProgressBar(LocaleKeys.Fiber.tr(), "25/38g"),
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

  Widget dotIndicator() {
    return Align(
      alignment: Alignment.center,
      child: DotsIndicator(
        mainAxisAlignment: MainAxisAlignment.center,
        dotsCount: 4,
        position: 0.0, //selectedPage.toDouble(),
        decorator: DotsDecorator(
          size: Size.square(10.0),
          color: Colors.grey, // Inactive color
          activeColor: ColorManager.secondry,
        ),
      ),
    );
  }

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
                        // ImageAssets.productsImage1,
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

  Widget linegraph() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                child: LineChartBox(
                  spotsl: const [
                    // FlSpot(0, 4),
                    // FlSpot(1, 3.0),
                    // FlSpot(2, 3.5),
                    // FlSpot(3.8, 4.1),
                    // FlSpot(4.4, 3.8),
                    // FlSpot(5.6, 4.3),
                    // FlSpot(6.7, 4),
                  ],
                  // ytitles: _x,
                  // xtitles: _y,
                  // flcolor: [widget.color],
                  // color: [widget.color.withOpacity(.2)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
