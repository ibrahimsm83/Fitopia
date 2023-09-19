import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/index_manager.dart';

class StoresView extends StatelessWidget {
  const StoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return userdetails(
                isImage: true,
                ImagePath: index % 2 == 0
                    ? ImageAssets.storeImage1
                    : ImageAssets.storeImage2);
          }),
    );
  }

  Widget userdetails({bool? isImage, String? ImagePath}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: ClipOval(
                child: Image.asset(
              ImageAssets.starUserImage1,
              height: 42,
              width: 42,
            )),
            title: Text(
              "James Olivia",
              style: getmediumStyle(
                  color: ColorManager.greyColor, fontSize: 12.mv),
            ),
            subtitle: Text(
              "2 hours ago",
              style: getmediumStyle(
                  color: ColorManager.greyColor, fontSize: 10.mv),
            ),
            trailing: Icon(Icons.more_horiz, color: ColorManager.greyColor),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Text(
              AppStrings.loremipsum3lines,
              style: getmediumStyle(
                  color: ColorManager.greyColor, fontSize: 10.mv),
            ),
          ),
          SizedBox(height: AppSize.s8),
          isImage ?? false
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 5.0),
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        colorFilter:
                            ColorFilter.mode(Colors.black12, BlendMode.darken),
                        fit: BoxFit.cover,
                        image: AssetImage(
                            ImagePath ?? ImageAssets.jamesOliviaImage),
                      ),
                    ),
                    // child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Align(
                    //       alignment: Alignment.topRight,
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           color: ColorManager.primary,
                    //           borderRadius: BorderRadius.circular(10.0),
                    //         ),
                    //         child: Padding(
                    //           padding: const EdgeInsets.symmetric(
                    //               horizontal: 10.0, vertical: 4.0),
                    //           child: Row(
                    //             mainAxisSize: MainAxisSize.min,
                    //             children: [
                    //               SvgPicture.asset(
                    //                 ImageAssets.cameraIcon,
                    //                 height: 8,
                    //                 width: 8,
                    //               ),
                    //               SizedBox(width: AppSize.s4),
                    //               Text(
                    //                 "LIVE",
                    //                 style: getsemiboldStyle(
                    //                     color: ColorManager.white,
                    //                     fontSize: 7.mv),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ))
                  ),
                )
              : SizedBox(),
          //stacked images
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageAssets.heartIcon,
                          color: ColorManager.primary,
                        ),
                        SizedBox(width: 5.0),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("1125",
                              style: getmediumStyle(
                                  color: ColorManager.blackColor,
                                  fontSize: AppSize.s10.mv)),
                        ),
                      ],
                    ),
                    SizedBox(width: 15.0),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageAssets.commentIcon,
                          color: Colors.red,
                        ),
                        SizedBox(width: 5.0),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("385",
                              style: getmediumStyle(
                                  color: ColorManager.blackColor,
                                  fontSize: AppSize.s10.mv)),
                        ),
                      ],
                    ),
                  ],
                ),
                //buildStackedImages(),
              ],
            ),
          ),
          Divider(color: Colors.grey),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      ImageAssets.likeIcon,
                    ),
                    SizedBox(width: 5.0),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Like",
                          style: getmediumStyle(
                              color: ColorManager.greyColor, fontSize: 11.mv)),
                    ),
                  ],
                ),
                // SizedBox(width: 15.0),
                Row(
                  children: [
                    SvgPicture.asset(
                      ImageAssets.commentIcon,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 5.0),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("Comment",
                          style: getmediumStyle(
                              color: ColorManager.greyColor,
                              fontSize: AppSize.s10.mv)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
