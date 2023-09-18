import 'package:easy_localization/easy_localization.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/presentation/home/analytics_screen.dart';
import 'package:fitopia/presentation/home/dashboard_screen.dart';
import 'package:fitopia/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/index_manager.dart';

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
          Container(child: Center(child: Text("Coming soon"))),
          Container(child: Center(child: Text("Coming soon"))),
          Container(child: Center(child: Text("Coming soon"))),
          // DeshboardView(),
          // StreamsView(),
          // MessagesView(),
          // NotificationView(),
          // ProfileView(),
        ],
      ),
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
          bottomNavbaritem(
              title: "", IconName: ImageAssets.infinityIcon, currentindex: 2),
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
