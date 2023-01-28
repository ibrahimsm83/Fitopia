import 'package:flutter/material.dart';

import '../presentation/resources/index_manager.dart';

// ignore: must_be_immutable
class CustomeTextFormField extends StatefulWidget {
  String? hintText;
  bool obscureText;
  double horizontalMergin;
  int maxLines;
  Color fillColor;
  TextInputType? keyboardType;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  CustomeTextFormField({
    Key? key,
    this.hintText,
    this.validator,
    this.fillColor = Colors.white,
    this.keyboardType,
    this.maxLines = 1,
    this.suffixIcon,
    this.horizontalMergin = 0.06,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<CustomeTextFormField> createState() => _CustomeTextFormFieldState();
}

class _CustomeTextFormFieldState extends State<CustomeTextFormField> {
  late bool _pwShow;
  @override
  void initState() {
    _pwShow = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * widget.horizontalMergin),
      child: TextFormField(
        style: TextStyle(color: ColorManager.blackColor),
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        obscureText: _pwShow,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          filled: true,
          isCollapsed: true,
          fillColor: widget.fillColor,
          hintText: widget.hintText,
          hintStyle: getmediumStyle(color: ColorManager.greyBorderColor),
          contentPadding: const EdgeInsets.fromLTRB(14, 14.0, 14.0, 14.0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  BorderSide(color: ColorManager.greyBorderColor, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: ColorManager.blackColor.withOpacity(0.2), width: 1.5)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.primary, width: 1.5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.primary, width: 1.5)),
          suffixIcon: widget.suffixIcon ??
              Visibility(
                visible: widget.obscureText,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _pwShow = !_pwShow;
                    });
                  },
                  child: _pwShow
                      ? Icon(
                          Icons.visibility_off,
                          color: ColorManager.primary,
                        )
                      : Icon(
                          Icons.visibility,
                          color: ColorManager.greyBorderColor,
                        ),
                ),
              ),
        ),
      ),
    );
  }
}
