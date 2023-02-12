import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/presentation/resources/index_manager.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class IndroductionPage extends StatefulWidget {
  String? imagepath;
  String? title;
  String? description;
  IndroductionPage({Key? key, this.imagepath, this.title, this.description})
      : super(key: key);

  @override
  _IndroductionPageState createState() => _IndroductionPageState();
}

class _IndroductionPageState extends State<IndroductionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.whiteColor,
      child: Column(
        children: [
          SizedBox(height: AppSize.sizeHeight(context) * 0.06),
          // Container(
          //   alignment: Alignment.center,
          //   child: logoImg,
          // ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              height: AppSize.sizeHeight(context) * 0.22,
              // width: 500,
              decoration: BoxDecoration(
                // color: Colors.green,
                image: DecorationImage(
                  image: AssetImage(widget.imagepath!),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 150),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title ?? "",
              textAlign: TextAlign.center,
              style: getboldStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color!,
                  fontSize: AppSize.s16.mv),
            ),
          ),
          // SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              widget.description!,
              textAlign: TextAlign.center,
              style: getRegularStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color!,
                  fontSize: AppSize.s12.mv),
            ),
          ),
          //SizedBox(height: sizeheight(context) / 9),

          //SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
