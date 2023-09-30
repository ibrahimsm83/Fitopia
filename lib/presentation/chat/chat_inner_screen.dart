import 'package:fitopia/presentation/Mixins/size.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/index_manager.dart';

class ChatInnerView extends StatefulWidget {
  @override
  _ChatInnerViewState createState() => _ChatInnerViewState();
}

class _ChatInnerViewState extends State<ChatInnerView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: appBarForChatScreen(context),
        // backgroundColor: ColorManager.secondarydarkColor,
        //  resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //---------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                          ImageAssets.arrowBack,
                          height: 18,
                          width: 18,
                          color: ColorManager.blackColor,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Stack(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              //borderRadius: BorderRadius.circular(10.0),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(ImageAssets.person2),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 16),
                      Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "James Olivia",
                              style: TextStyle(
                                  fontSize: 16, color: ColorManager.blackColor),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Online",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        ImageAssets.cameraIcon,
                        color: ColorManager.blackColor,
                      ),
                      SizedBox(width: 10.0),
                      SvgPicture.asset(
                        ImageAssets.chatAudioCallIcon,
                        color: ColorManager.blackColor,
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
              Divider(color: ColorManager.greyColor),
              //---------------------------------------------------
              Expanded(
                child: Container(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      userChatBubble('I just started a new book'),
                      SizedBox(
                        height: 10,
                      ),
                      otherUserChatBubble('Im Good, What\'s up'),
                      SizedBox(
                        height: 10,
                      ),
                      userChatBubble('How are you?'),
                      SizedBox(
                        height: 10,
                      ),
                      userChatBubble('Hi There'),
                      SizedBox(
                        height: 20,
                      ),
                      otherUserChatBubble('Im Good, What\'s up'),
                      SizedBox(
                        height: 10,
                      ),
                      userChatBubble('I just started a new book'),
                      SizedBox(
                        height: 10,
                      ),
                      otherUserChatBubble('Im Good, What\'s up'),
                      SizedBox(
                        height: 10,
                      ),
                      userChatBubble('How are you?'),
                      SizedBox(
                        height: 10,
                      ),
                      userChatBubble('Hi There'),
                      SizedBox(
                        height: 20,
                      ),
                      otherUserChatBubble('Im Good, What\'s up'),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: ColorManager.greyBoxColor,
                      //color: Color(0xfff1f1f1),
                      border: Border.all(color: Colors.grey)),
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: SvgPicture.asset(
                              ImageAssets.smileIcon,
                              // height: 18,
                              //color: Colors.blackColor,
                            )),
                      ),
                      Expanded(
                          child: TextField(
                        cursorColor: ColorManager.primary,
                        decoration: InputDecoration(
                            hintText: 'Typing Comment...',
                            focusColor: Colors.red,
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintStyle: getmediumStyle(
                                color: ColorManager.greyColor,
                                fontSize: AppSize.s10.mv)),
                      )),
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.primary,
                        ),
                        child: SvgPicture.asset(
                          ImageAssets.sendIcon,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  appBarForChatScreen(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Container(
          decoration: BoxDecoration(
              color: ColorManager.greyBoxColor,
              boxShadow: [
                BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)
              ]),
          height: 56,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  print('presses');
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    ImageAssets.arrowBack,
                    color: ColorManager.blackColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => DashBoard(page:4),
                  //   ),
                  // );
                },
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 45,
                          child: Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.only(
                                left: 0.0, right: 8.0, top: 8.0, bottom: 8.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/john.jpg'),
                                  fit: BoxFit.fill),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          top: 30,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            maxRadius: 5,
                            child: CircleAvatar(
                              maxRadius: 4,
                              backgroundColor: Color(0xff51ce6a),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('John Smith'),
                        Text(
                          'online',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, 'AudioCall');
                },
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  height: 40,
                  width: 40,
                  child: SvgPicture.asset(
                    ImageAssets.videocallIcon,
                  ),
                ),
              ),
              SizedBox(width: 5.0),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, 'VideoCall');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  height: 40,
                  width: 40,
                  child: SvgPicture.asset(
                    ImageAssets.audiocallIcon,
                  ),
                ),
                // Container(
                //     height: 40,
                //     width: 40,
                //     padding: EdgeInsets.all(4.0),
                //     margin: EdgeInsets.only(
                //         left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10.0)),
                //     child: Icon(Icons.videocam, color: Colors.grey)),
              ),
              SizedBox(width: 10.0),
            ],
          ),
        ));
  }

  userChatBubble(String message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 40,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              decoration: BoxDecoration(
                  color: ColorManager.primarydarkColor,
                  borderRadius: BorderRadius.circular(30.0)
                  // borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(30.0),
                  //     bottomRight: Radius.circular(30.0),
                  //     topLeft: Radius.circular(30.0)

                  //     )
                  ),
              child: Center(
                  child: Text(
                message,
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '4.15 pm',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        )
      ],
    );
  }

  otherUserChatBubble(String message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(30.0)
                  // borderRadius: BorderRadius.only(
                  //     topRight: Radius.circular(30.0),
                  //     bottomRight: Radius.circular(30.0),
                  //     topLeft: Radius.circular(30.0))
                  ),
              child: Center(
                  child: Text(
                message,
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '4.15 pm',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        )
      ],
    );
  }
}
