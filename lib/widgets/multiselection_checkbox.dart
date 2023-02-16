import 'package:easy_localization/easy_localization.dart';
import 'package:fitopia/presentation/resources/index_manager.dart';
import 'package:flutter/material.dart';
import '../model/onboarding_model.dart';

class MultiSelectionCheckBox extends StatefulWidget {
  final Key? key;
  final onBoradingModel? item;
  final ValueChanged<bool>? isSelected;

  MultiSelectionCheckBox({this.item, this.isSelected, this.key});

  @override
  _MultiSelectionCheckBoxState createState() => _MultiSelectionCheckBoxState();
}

class _MultiSelectionCheckBoxState extends State<MultiSelectionCheckBox> {
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
        // margin: EdgeInsets.only(left: 3.0, right: 3.0, top: 10, bottom: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Text(
            widget.item!.title.toString().tr(),
            style: getboldStyle(
              color: Theme.of(context).textTheme.bodyText1!.color!,
            ),
          ),
          trailing: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? ColorManager.secondry
                  : ColorManager.greyBorderColor,
            ),
            child: Visibility(
              visible: isSelected,
              child: Center(
                child: Icon(
                  Icons.check,
                  color: ColorManager.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
