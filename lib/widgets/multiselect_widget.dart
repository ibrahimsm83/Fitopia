import 'package:easy_localization/easy_localization.dart';
import 'package:fitopia/presentation/resources/index_manager.dart';
import 'package:flutter/material.dart';
import '../model/onboarding_model.dart';

class GridItem extends StatefulWidget {
  final Key? key;
  final onBoradingModel? item;
  final ValueChanged<bool>? isSelected;

  GridItem({this.item, this.isSelected, this.key});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected!(isSelected);
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 3.0, right: 3.0, top: 10, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
        decoration: BoxDecoration(
          color:
              isSelected ? ColorManager.secondry : ColorManager.greylightColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorManager.greylightColor),
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
              //"title",
              widget.item!.title.toString().tr(),
              //  name![index].title.toString(),
              style: getboldStyle(
                  color: isSelected
                      ? ColorManager.whiteColor
                      : ColorManager.blackColor),
            ),
            subtitle: Text(
              //"subtitle",
              widget.item!.description.toString(),
              style: getboldStyle(
                  color: isSelected
                      ? ColorManager.whiteColor
                      : ColorManager.blackColor),
            )),
      ),

      /*Stack(
        children: <Widget>[
          Container(
            //height: 100,
            width: 100,
            color:Colors.red,
            // Colors.black.withOpacity(isSelected ? 0.9 : 0),
          ),
          // Image.asset(
          //   widget.item.imageUrl,
          //   color: Colors.black.withOpacity(isSelected ? 0.9 : 0),
          //   colorBlendMode: BlendMode.color,
          // ),
          isSelected
              ? Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.check_circle,
                color: Colors.blue,
              ),
            ),
          )
              : Container()
        ],
      ),*/
    );
  }
}
