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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  name!.length,
                  (index) => GestureDetector(
                        onTap: () => callback!(index),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 3.0, right: 3.0, top: 10, bottom: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 3.0),
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
                              //tileColor: ColorManager.secondry,
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
                                name![index].description.toString(),
                                //  AppStrings.getLeanerImproveFitness,
                                style: getboldStyle(
                                    color: selected == index
                                        ? ColorManager.whiteColor
                                        : ColorManager.blackColor),
                              )),

                          // Center(
                          //   child: Text(
                          //     name![index],
                          //     style:
                          //         TextStyle(fontSize: 16, color: Colors.white),
                          //   ),
                          // ),
                        ),
                      )))),
    );
  }
}
