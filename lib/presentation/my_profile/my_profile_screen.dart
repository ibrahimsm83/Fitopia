import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/index_manager.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            "My Profile",
            style: getboldStyle(
                color: ColorManager.blackColor, fontSize: AppSize.s16),
          )),
    );
  }
}