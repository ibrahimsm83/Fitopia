import 'package:flutter/material.dart';
import 'package:fitopia/widgets/custome_button.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/model/subscription_model.dart';
import 'package:fitopia/widgets/subscriptionModelList.dart';

import '../resources/index_manager.dart';

class SubscriptionView extends StatefulWidget {
  SubscriptionView({super.key});
  @override
  State<SubscriptionView> createState() => _SubscriptionViewState();
}

class _SubscriptionViewState extends State<SubscriptionView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20.vs),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                height: AppSize.sizeHeight(context) * 0.22,
                // width: 500,
                decoration: BoxDecoration(
                  // color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.subscriptionImage),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Text(
              "Your first 7 days are free.",
              style: getboldStyle(
                  color: ColorManager.blackColor, fontSize: AppSize.s16),
            ),
            subWidget(subscriptionList),
            SizedBox(height: 10.vs),
            button(
                text: "Next",
                color: ColorManager.primary,
                onTap: () {
                    Navigator.pushNamed(
                      context, Routes.CreaditCardAddViewPageRoute);
                }),
            SizedBox(height: 1.vs),
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

  Widget subWidget(List<SubscriptionModel>? itemList) {
    return FixedTogglesSubscriptionList(
      selected: selectedIndex,
      callback: (int index) {
        setState(() {
          selectedIndex = index;
        });
      },
      sub: itemList,
    );
  }
}
