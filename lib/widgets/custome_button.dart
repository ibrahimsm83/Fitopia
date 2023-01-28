
import 'package:flutter/material.dart';
import '../presentation/resources/index_manager.dart';

// ignore: must_be_immutable
class CustomeButton extends StatelessWidget {
  String? text;
  FontWeight? fontWeight;
 final Color? color;
  Function()? onTap;
  TextStyle? style;

  CustomeButton(
      {Key? key,
      this.onTap,
      this.text,
      this.style,
      this.fontWeight = FontWeight.normal,
      this.color = ColorManager.blackColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            text!,
            style: style,
            // TextStyle(color: AppColors.whiteColor, fontWeight: fontWeight),
          ),
        )),
      ),
    );
  }
}
