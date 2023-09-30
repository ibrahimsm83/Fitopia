import 'package:fitopia/model/more_menue_model.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/presentation/resources/index_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          ClipPath(
            clipper: ProsteBezierCurve(
              position: ClipPosition.bottom,
              list: [
                BezierCurveSection(
                  start: Offset(0, 200),
                  top: Offset(AppSize.sizeWidth(context) / 2, 150),
                  end: Offset(AppSize.sizeWidth(context), 200),
                ),
              ],
            ),
            child: Container(
              height: 200,
              color: ColorManager.secondryTwo,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 200 - 175, left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActiveProgess("Active", "01", "Day"),
                    imageWidget(),
                    ActiveProgess("Progess", "0 KG", "Kgs lost"),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              //color: Colors.red,
              child: ListView.builder(
                  itemCount: moreList.length,
                  itemBuilder: (context, index) {
                    return moreListTile(moreList[index], () {
                      print(index);

                      switch (index) {
                        case 0:
                          Navigator.pushNamed(
                              context, Routes.myProfilePageRoute);
                          break;
                        case 1:
                          Navigator.pushNamed(
                              context, Routes.myProgramPageRoute);
                          break;
                        case 2:
                          Navigator.pushNamed(
                              context, Routes.myMealsPlansPageRoute);
                          break;
                        case 3:
                          Navigator.pushNamed(context, Routes.receipePageRoute);
                          break;
                        case 4:
                          Navigator.pushNamed(
                              context, Routes.workoutRoutinePageRoute);
                          break;
                        case 5:
                          Navigator.pushNamed(
                              context, Routes.nutritionPageRoute);
                          break;
                        case 6:
                          Navigator.pushNamed(context, Routes.ebookPageRoute);
                          break;
                        case 7:
                          Navigator.pushNamed(
                              context, Routes.SettingsPageRoute);
                          break;
                        case 8:
                          Navigator.pushNamed(context, Routes.chatPageRoute);
                          break;
                        case 9:
                          Navigator.pushNamed(context, Routes.helpPageRoute);
                          break;
                        // case 10:
                        //   Navigator.pushNamed(context, Routes.logoutPageRoute);
                        //  break;
                        default:
                      }
                    });
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget imageWidget() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage(ImageAssets.userStoreImge1),
          ),
        ),
      ),
      SizedBox(height: 3.0),
      Text("Jhon Doe",
          style: getmediumStyle(
              color: ColorManager.whiteColor, fontSize: AppSize.s13.mv)),
      SizedBox(height: 3.0),
      Row(
        children: [
          Image.asset(ImageAssets.crownIcon, height: 10, width: 10),
          SizedBox(width: 6.0),
          Text("Premium",
              style: getmediumStyle(
                  color: ColorManager.whiteColor, fontSize: AppSize.s8.mv)),
        ],
      ),
    ]);
  }

  Widget ActiveProgess(String txt1, String txt2, String txt3) {
    return Column(
      children: [
        Text(txt1,
            style: getRegularStyle(
                color: ColorManager.whiteColor, fontSize: AppSize.s13.mv)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(txt2,
              style: getmediumStyle(
                  color: ColorManager.whiteColor, fontSize: AppSize.s16.mv)),
        ),
        Text(txt3,
            style: getRegularStyle(
                color: ColorManager.whiteColor, fontSize: AppSize.s13.mv)),
      ],
    );
  }

  Widget moreListTile(MoreModel? model, Function()? onTap) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(model!.iconPath!),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                model.title ?? "",
                style: getRegularStyle(
                    color: ColorManager.blackColor, fontSize: AppSize.s14.mv),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
