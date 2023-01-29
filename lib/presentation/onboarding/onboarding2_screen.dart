import 'package:fitopia/model/onboarding_model.dart';
import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/presentation/onboarding/multiselect_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/index_manager.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {

  List<onBoradingModel>? itemList;  
List<onBoradingModel>? selectedList;


 List<onBoradingModel>? mylist = [
    onBoradingModel(
      id: 1,
        title: AppStrings.loseWeight,
        description: AppStrings.getLeanerImproveFitness),
    onBoradingModel(
      id: 2,
        title: AppStrings.Leanbulk,
        description: AppStrings.getLeanerImproveFitness),
    onBoradingModel(
      id: 3,
        title: AppStrings.Gainweight,
        description: AppStrings.getLeanerImproveFitness),
    onBoradingModel(
      id: 4,
        title: AppStrings.Gainweight,
        description: AppStrings.getLeanerImproveFitness),
    onBoradingModel(
      id: 5,
        title: AppStrings.Gainweight,
        description: AppStrings.getLeanerImproveFitness),
    onBoradingModel(
      id: 6,
        title: AppStrings.Gainweight,
        description: AppStrings.getLeanerImproveFitness),
    onBoradingModel(
      id: 7,
        title: AppStrings.Gainweight,
        description: AppStrings.getLeanerImproveFitness),
  ];
@override
  void initState() {
   itemList=mylist;
   //selectedList=mylist;
    super.initState();
  }

// loadList() {    
// itemList = List();    
// selectedList = List(); 
   
// List.generate(20,(index){
// itemList.add(Item("assets/pringles.png", index+1));
// }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.vs),
           // statusBar(),
            //loginImage
            SizedBox(height: AppSize.s28.vs),
            SvgPicture.asset(
              ImageAssets.onboarding1,
            ),
            SizedBox(height: AppSize.s28.vs),
            Text(
              AppStrings.whatsyourgoal,
              style: getboldStyle(
                  color: ColorManager.blackColor, fontSize: AppSize.s20.mv),
            ),
            SizedBox(height: AppSize.s28.vs),

            /*
             FixedTogglesButtonsList(
              selected: selectedIndex,
              callback: (int index) {
                setState(() {
                  selectedIndex = index;
                });
                //pageController.jumpToPage(index);
              },
              name: _chellengesList,
            ),
             */
Flexible(
  child:   ListView.builder(
            itemCount: itemList!.length,
            shrinkWrap: true,
            
            itemBuilder: (context, index) {
              return GridItem(
                  item: itemList![index],
                  isSelected: (bool value) {
                    setState(() {
                      if (value) {
                        selectedList?.add(itemList![index]);
                      } else {
                        selectedList?.remove(itemList![index]);
                      }
                    });
                    print("$index : $value");
                  },
                  key: Key(itemList![index].id.toString()));
            }),
),
          ])),
    );
  }
}