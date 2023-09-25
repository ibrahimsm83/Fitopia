// ignore_for_file: must_be_immutable

import 'package:fitopia/presentation/resources/index_manager.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  final int index;
  final String title;
  final String subtile;
  final String des;
  final String imagepath;

  ProductCardWidget({
    Key? key,
    this.index = 0,
    this.title = "",
    this.subtile = "",
    this.des = "",
    this.imagepath = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'HouseDetails');
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, bottom: 10.0, top: 5.0),
        child: Container(
          width: AppSize.sizeWidth(context),
          height: MediaQuery.of(context).size.height * 0.13,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(imagepath))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Theme.of(context).cardColor,
                  width: AppSize.sizeWidth(context) -
                      (MediaQuery.of(context).size.width * 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorManager.greyBorderColor,
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 3.0),
                          child: Text(
                            title,
                            style:
                                getRegularStyle(color: ColorManager.blackColor),
                          ),
                        ),
                      ),
                      Text(
                        subtile,
                        style: getboldStyle(color: ColorManager.blackColor),
                        textAlign: TextAlign.start,
                      ),
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(des,
                            style: getRegularStyle(
                                color: ColorManager.blackColor)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
