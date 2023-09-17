import 'package:fitopia/model/deshboard_model.dart';
import 'package:flutter/material.dart';
import '../presentation/resources/index_manager.dart';

class WeekDaysToggleButtonsList extends StatelessWidget {
  final int? selected;
  final Function? callback;
  final List<weekDaysModel>? list;

  const WeekDaysToggleButtonsList(
      {Key? key, this.selected, this.callback, this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 15.0),
        scrollDirection: Axis.horizontal,
        itemCount: list!.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => callback!(index),
          child: Padding(
            padding: EdgeInsets.only(left: index == 0 ? 15 : 0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: selected == index
                      ? ColorManager.secondry
                      : ColorManager.greylightColor,
                  shape: BoxShape.circle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(list![index].day.toString(),
                      style: getmediumStyle(
                          color: selected == index
                              ? ColorManager.whiteColor
                              : ColorManager.blackColor)),
                  Text(list![index].date.toString(),
                      style: getboldStyle(
                          color: selected == index
                              ? ColorManager.whiteColor
                              : ColorManager.blackColor,
                          fontSize: 16)),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    //);
  }
}
