import 'package:fitopia/presentation/resources/index_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class CompareDetailsList extends StatelessWidget {
  final String imagepath;
  final Function()? onTapDetaislarea;
  final Function()? onTapDelete;

  const CompareDetailsList(
      {Key? key, this.imagepath = "", this.onTapDelete, this.onTapDetaislarea})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, 'HouseDetails');
      },
      child: Container(
        width: AppSize.sizeWidth(context) * 0.46,
        margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
        decoration: BoxDecoration(
            color: ColorManager.greyBoxColor,
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      // bottomLeft: Radius.circular(10.0),
                      // bottomRight: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                  image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Colors.black26, BlendMode.darken),
                      fit: BoxFit.cover,
                      image: AssetImage(
                        //'assets/images/city5.jpg',
                        imagepath,
                      ))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {}, //onTapDelete,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.grey,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            GestureDetector(
              onTap: onTapDetaislarea,
              child: Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Container(
                  // color: Theme.of(context).cardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3),
                      Text(
                        "Jump Skipping Rope",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text('Price',
                              // widget.address,
                              style: getboldStyle(color: Colors.red)
                              // overflow: TextOverflow.ellipsis,
                              // maxLines: 1,
                              ),
                          SizedBox(width: 3),
                          Text(" \$250.00",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('*******',
                              style: getboldStyle(
                                  color: Colors.green, fontSize: 18)),
                          SizedBox(
                            width: 3,
                          ),
                          Text(" 23 Reviews",
                              style: getRegularStyle(
                                  color: ColorManager.greyColor)),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                          " Another piece of equipment that can provide a great cardio workout is the elliptical trainer.",
                          style:
                              getRegularStyle(color: ColorManager.greyColor)),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          width: AppSize.sizeWidth(context),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget housedetails(String iconpath, String detail, BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          child: SvgPicture.asset(
            iconpath,
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        SizedBox(width: 3.0),
        SizedBox(
          width: AppSize.sizeWidth(context) * 0.28,
          child: Text(
            detail,
            style: TextStyle(
                color: Theme.of(context).backgroundColor, fontSize: 13),
          ),
        ),
      ],
    );
  }
}
