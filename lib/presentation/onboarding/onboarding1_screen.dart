import 'package:fitopia/model/onboarding_model.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/presentation/onboarding/multiselect_widget.dart';
import 'package:fitopia/presentation/resources/index_manager.dart';
import 'package:fitopia/widgets/custome_button.dart';
import 'package:fitopia/widgets/toggle_buttons_vertical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding1View extends StatefulWidget {
  const Onboarding1View({super.key});

  @override
  State<Onboarding1View> createState() => _Onboarding1ViewState();
}

class _Onboarding1ViewState extends State<Onboarding1View> {
List<onBoradingModel>? selectedList;

  int selectedIndex = 0;
  int currentPage=0;

List<bool> isStatusBarActive=[true,false,false,false];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
          //SizedBox(height: 20.vs),
            Align(
              alignment: Alignment.topCenter,
              //padding: EdgeInsets.only(top: 20),
              child: statusBar()),
            //SizedBox(height: AppSize.s28.vs),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SvgPicture.asset(
                ImageAssets.onboarding1,
              ),
            ),
           // SizedBox(height: AppSize.s28.vs),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Text(
                AppStrings.whatsyourgoal,
                style: getboldStyle(
                    color: ColorManager.blackColor, fontSize: AppSize.s20.mv),
              ),
            ),
           // SizedBox(height: AppSize.s28.vs),

            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: SizedBox(child:
         currentPage==0?  onboarding1Widget() :currentPage==1?
           onboarding2Widget(DietryRequirmentList):onboarding3Widget(HowActiveAreYouList),),
            ),
           // currentPage == 1 ?  Spacer():SizedBox(),
            Align(
              alignment: Alignment.bottomCenter,
              child: button(
                  text: AppStrings.next,
                  color: ColorManager.primary,
                  onTap: () {
                    setState(() {
                      if(currentPage==0){
                         isStatusBarActive[1]=true;
                        currentPage=1;
                      }else if(currentPage==1){
                         isStatusBarActive[2]=true;
                        currentPage=2;
                      }
                    });
                    // Navigator.pushReplacementNamed(
                    //     context, Routes.Onboarding1Route);
                  }),
            ),
            SizedBox(height: AppSize.s28.vs),
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
Widget onboarding2Widget(List<onBoradingModel>? itemList){
  return  FixedTogglesButtonsList(
              selected: selectedIndex,
              callback: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              name: itemList,
            );
}

Widget onboarding3Widget(List<onBoradingModel>? itemList){
  return  FixedTogglesButtonsList(
              selected: selectedIndex,
              callback: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              name: itemList,
            );
}
  Widget onboarding1Widget(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
                itemCount: goalList!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GridItem(
                      item: goalList![index],
                      isSelected: (bool value) {
                        setState(() {
                          if (value) {
                            selectedList?.add(goalList![index]);
                          } else {
                            selectedList?.remove(goalList![index]);
                          }
                        });
                        print("$index : $value");
                      },
                      key: Key(goalList![index].id.toString()));
                }),
    );
  }

  Widget statusBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
              height: 10,
              // width: 50,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              height: 10,
              // width: 50,
              decoration: BoxDecoration(
                color:isStatusBarActive[1]?ColorManager.primary: ColorManager.greyColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              height: 10,
              // width: 50,
              decoration: BoxDecoration(
                color: ColorManager.greyColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Container(
              height: 10,
              // width: 50,
              decoration: BoxDecoration(
                color: ColorManager.greyColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );

    // SizedBox(
    //   height: 15,
    //   child: ListView.separated(
    //     separatorBuilder: (context, index) => SizedBox(width: 10.0),
    //     scrollDirection: Axis.horizontal,
    //     itemCount: 4,
    //     itemBuilder: ((context, index) =>

    //         ),
    //   ),
    // );
  }
}
