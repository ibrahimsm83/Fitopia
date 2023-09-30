import 'package:fitopia/presentation/Mixins/size.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/index_manager.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  static List<String> storiesprofile = <String>[
    ImageAssets.person8,
    ImageAssets.person9,
    ImageAssets.person10,
    ImageAssets.person7,
    ImageAssets.person6,
    ImageAssets.person5,
    ImageAssets.person4,
    ImageAssets.person2,
    ImageAssets.person3,
    ImageAssets.person1,
  ];
  static List<String> storiesname = <String>[
    "Dan Brian",
    "Ramon Miles",
    "Riley Gilbert",
    "JNathaniel Ethan",
    "Ramon Miles",
    "Wade Dave",
    "Seth Ivan",
    "Riley Gilbert",
    "Jorge Dan",
    "Brian Roberto",
    "Ramon Miles"
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
            "Chat",
            style: getboldStyle(
                color: ColorManager.blackColor, fontSize: AppSize.s18),
          )),
      body: ListView.separated(
          padding: EdgeInsets.zero,
          separatorBuilder: ((context, index) => Divider(
                color: ColorManager.greyColor,
              )),
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  //InnerChat
                  Navigator.pushNamed(context, Routes.chatInnerViewPageRoute);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => InnerChat()));
                },
                child: chatUser(storiesname[index], storiesprofile[index]));
          }),
    );
  }

  Widget chatUser(String? name, String? img) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage(img!),
            ),
            SizedBox(width: 5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: AppSize.sizeWidth(context) / 1.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name!,
                        style: TextStyle(
                            color: ColorManager.blackColor,
                            fontSize: 12.mv,
                            fontWeight: FontWeightManager.bold),
                      ),
                      Text(
                        "2m ago",
                        style: TextStyle(
                            fontSize: 10.mv, color: ColorManager.greyColor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hey! Please make sure to check",
                      style: getRegularStyle(color: AppColors.chatTextColor)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
