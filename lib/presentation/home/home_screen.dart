import 'package:circular_menu/circular_menu.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:ff_navigation_bar_plus/ff_navigation_bar_plus.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/presentation/home/analytics_screen.dart';
import 'package:fitopia/presentation/home/dashboard_screen.dart';
import 'package:fitopia/presentation/home/more_view.dart';
import 'package:fitopia/presentation/home/stories_view.dart';
import 'package:fitopia/presentation/home/NewsFeedsView.dart';
import 'package:fitopia/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/index_manager.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pagecontroller;
  var _currentIndex = 0;
  @override
  void initState() {
    _pagecontroller = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        controller: _pagecontroller,
        onPageChanged: (val) {
          setState(() {
            _currentIndex = val;
          });
        },
        children: <Widget>[
          DashboardView(),
          AnalyticsView(),

          //Container(child: Center(child: Text("Coming soon"))),
          // Container(child: Center(child: Text("Coming soon"))),
          NewsFeedsView(),
          StoresView1(),
          MoreView(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FabCircularMenuPlus(
          fabOpenColor: Colors.red,
          fabCloseIcon: Icon(Icons.close, color: ColorManager.whiteColor),
          fabCloseColor: ColorManager.greyBoxColor,
          fabElevation: 0.0,
          ringColor: Colors.black26,
          ringDiameter: 400,
          ringWidthLimitFactor: 0.2,
          fabOpenIcon: Padding(
            padding: const EdgeInsets.all(6.0),
            child:
                Image.asset(ImageAssets.InfinityPngIcon, fit: BoxFit.contain),
          ),
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            SizedBox(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
            // circularMenueIcon(ImageAssets.workoutIcon, "Workout",
            //     ColorManager.fabYellowColor),
            // circularMenueIcon(ImageAssets.nutritionFabIcon, "Nutration",
            //     ColorManager.fabPurpleColor),
            // circularMenueIcon(
            //     ImageAssets.barcodeIcon, "Barcode", ColorManager.fabgreenColor),
            // circularMenueIcon(
            //     ImageAssets.timerIcon, "Timer", ColorManager.fabBlueColor),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: ColorManager.greyBoxColor,
        selectedItemColor: ColorManager.secondry,
        showUnselectedLabels: true,
        selectedFontSize: 0.0,
        onTap: (value) {
          setState(() => _currentIndex = value);
          _pagecontroller.jumpToPage(value);
        },
        items: [
          bottomNavbaritem(
              title: LocaleKeys.Dashboard.tr(),
              IconName: ImageAssets.deshboardIcon,
              currentindex: 0),
          bottomNavbaritem(
              title: "Analytics", //LocaleKeys.myPlans.tr(),
              IconName: ImageAssets.AnalyticsIcon,
              currentindex: 1),
          // bottomNavbaritem(title: "", IconName: null, currentindex: 2),
          BottomNavigationBarItem(
            label: "",
            icon: SizedBox(),
          ),
          bottomNavbaritem(
              title: LocaleKeys.Stores.tr(),
              IconName: ImageAssets.storesIcon,
              currentindex: 3),
          bottomNavbaritem(
              title: LocaleKeys.More.tr(),
              IconName: ImageAssets.moreIcon,
              currentindex: 4),
        ],
      ),
    );
  }

  Widget circularMenueIcon(String IconPath, String title, Color? color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: color ?? Colors.yellow, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(IconPath, color: ColorManager.blackColor),
            )),
        SizedBox(height: 5.0),
        Text(title, style: getmediumStyle(color: color ?? Colors.yellow))
      ],
    );
  }

  BottomNavigationBarItem bottomNavbaritem(
      {String? title, String? IconName, int? currentindex}) {
    return BottomNavigationBarItem(
      label: "",
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Column(
          children: [
            SvgPicture.asset(
              IconName!,
              color: currentindex == _currentIndex
                  ? ColorManager.secondry
                  : ColorManager.darkGreyColor,
            ),
            SizedBox(height: 5.0),
            Text(
              title ?? "",
              style: TextStyle(
                fontSize: 10.mv,
                color: currentindex == _currentIndex
                    ? ColorManager.secondry
                    : ColorManager.darkGreyColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
