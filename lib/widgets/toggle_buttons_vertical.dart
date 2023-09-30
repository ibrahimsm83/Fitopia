import 'package:fitopia/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import '../presentation/resources/index_manager.dart';

class FixedTogglesButtonsList extends StatelessWidget {
  final int? selected;
  final Function? callback;
  final List<onBoradingModel>? name;


  const FixedTogglesButtonsList(
      {Key? key, this.selected, this.callback, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       itemCount: name!.length,
       shrinkWrap: true,
       itemBuilder: (context, index) 
       // {
       //   return
     // children: List.generate(
     //     name!.length,
     //     (index)
      => 
         GestureDetector(
               onTap: () => callback!(index),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(
                   height: 70,
                   decoration: BoxDecoration(
                     color: selected == index
                         ? ColorManager.secondry
                         : ColorManager.greylightColor,
                     borderRadius: BorderRadius.circular(15),
                     border:Border.all(color:ColorManager.greylightColor),
                   ),
                   child: ListTile(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.only(
                               topLeft: Radius.circular(15),
                               topRight: Radius.circular(15),
                               bottomRight: Radius.circular(15),
                               bottomLeft: Radius.circular(15))),
                      
                       leading: CircleAvatar(
                         backgroundColor: ColorManager.avatarColor,
                       ),
                       title: Text(
                         name![index].title.toString(),
                         style: getboldStyle(
                             color: selected == index
                                 ? ColorManager.whiteColor
                                 : ColorManager.blackColor),
                       ),
                       subtitle: Text(
                         name![index].description??"",
                         style: getRegularStyle(
                             color: selected == index
                                 ? ColorManager.whiteColor
                                 : ColorManager.subtitleColor),
                       )),

             
                 ),
               ),
             ),);
                  
    //);
  }
}
