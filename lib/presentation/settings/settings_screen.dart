import 'package:fitopia/presentation/resources/index_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  List<String> myList = [
    "about Us",
    "frequently Asked questions",
    "Contact Support",
    "Terms of Services",
    "Troubleshooting",
    "New Updates",
    "Delete Account",
    "subscriptions",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorManager.greyBoxColor,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SvgPicture.asset(
                ImageAssets.arrowBack,
                color: ColorManager.blackColor,
              ),
            ),
          ),
          title: Text(
            "Settings",
            style: getboldStyle(
                color: ColorManager.blackColor, fontSize: AppSize.s18),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: myList.length,
          separatorBuilder: (context, i) => Divider(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                myList[index],
                style: getRegularStyle(color: ColorManager.blackColor),
              ),
            );
          },
        ),
      ),
    );
  }
}
