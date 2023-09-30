import 'package:fitopia/model/subscription_model.dart';
import 'package:flutter/material.dart';
import '../presentation/resources/index_manager.dart';

class FixedTogglesSubscriptionList extends StatelessWidget {
  final int? selected;
  final Function? callback;
  final List<SubscriptionModel>? sub;


  const FixedTogglesSubscriptionList(
      {Key? key, this.selected, this.callback, this.sub})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       itemCount: sub!.length,
       shrinkWrap: true,
       itemBuilder: (context, index) 
       // {
       //   return
     // children: List.generate(
     //     sub!.length,
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
                      
                      //  leading: CircleAvatar(
                      //    backgroundColor: ColorManager.avatarColor,
                      //  ),
                       title: Text(
                         sub![index].title1.toString(),
                         style: getboldStyle(
                             color: selected == index
                                 ? ColorManager.whiteColor
                                 : ColorManager.blackColor),
                       ),
                       subtitle: Text(
                         sub![index].subtitle??"",
                         style: getRegularStyle(
                             color: selected == index
                                 ? ColorManager.whiteColor
                                 : ColorManager.subtitleColor),
                       ),
                       trailing:  Text(
                         sub![index].title2??"",
                         style: getRegularStyle(
                             color: selected == index
                                 ? ColorManager.whiteColor
                                 : ColorManager.subtitleColor),
                       )),
                       
                       ),

             
                 ),
               ),
             );
                  
    //);
  }
}
