import 'package:fitopia/presentation/Mixins/size.dart';
import 'package:fitopia/widgets/compare_details_list.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../resources/index_manager.dart';

class StoresView1 extends StatefulWidget {
  const StoresView1({super.key});

  @override
  State<StoresView1> createState() => _StoresView1State();
}

class _StoresView1State extends State<StoresView1> {
  final PageController _controller = PageController(initialPage: 0);
  int selectedIndex = 0;

  static List<String> storiesprofile = <String>[
    ImageAssets.userStoreImge1,
    ImageAssets.userStoreImge2,
    ImageAssets.userStoreImge3,
    ImageAssets.userStoreImge4,
    ImageAssets.userStoreImge5,
    ImageAssets.userStoreImge1,
    ImageAssets.userStoreImge2,
    ImageAssets.userStoreImge4,
    ImageAssets.userStoreImge5,
    ImageAssets.userStoreImge3,
  ];
  static List<String> gymImage = <String>[
    ImageAssets.gymImage1,
    ImageAssets.gymImage2,
    ImageAssets.gymImage3,
    ImageAssets.gymImage4,
  ];
  static List<String> storiesname = <String>[
    "Apparel",
    "Supplements",
    "Equipments",
    "Electronics",
    "Wall Posters",
    "Apparel",
    "Supplements",
    "Equipments",
    "Electronics",
    "Wall Posters",
    "Equipments",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30.0),
          talentShowcase(),
          dotIndicatorWidget(),
          SizedBox(height: 10.0),
          users(),
          gridView(),
        ],
      ),
    );
  }

  Widget gridView() {
    return Flexible(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 340,
            crossAxisSpacing: 6,
            mainAxisSpacing: 0),
        // padding: EdgeInsets.symmetric(horizontal: 8.0),
        shrinkWrap: true,
        // scrollDirection: Axis.horizontal,
        itemCount: gymImage.length,
        itemBuilder: (context, index) {
          return CompareDetailsList(
            imagepath: gymImage[index],
            onTapDetaislarea: () {},
            //  Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => PropertyDetailsPg())),
            onTapDelete: (() {
              // setState(() {
              //   cityImg.removeAt(index);
              // });
            }),
          );
        },
      ),
    );
  }

  Widget users() {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              //Navigator.pushNamed(context, Routes.OpenStoryViewRoute);
            },
            child: Column(children: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage(storiesprofile[index]),
                  ),
                ),
              ),
              SizedBox(height: 6.0),
              Text(storiesname[index],
                  style: getmediumStyle(
                      color: ColorManager.greyColor, fontSize: AppSize.s8.mv)),
            ]),
          ),
        ),
      ),
    );
  }

  Widget talentShowcase() {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 22.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            children: List.generate(
              4,
              ((index) => Container(
                    width: double.infinity,
                    child: Image.asset(
                      ImageAssets.storeSliderImg1,
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
          ),
        ));
  }

  Widget dotIndicatorWidget() {
    return Align(
      alignment: Alignment.center,
      child: SmoothPageIndicator(
          controller: _controller,
          count: 4,
          // effect: SlideEffect,
          effect: SlideEffect(
            spacing: 8.0,
            radius: 10.0,
            dotWidth: 10.0,
            dotHeight: 10.0,
            paintStyle: PaintingStyle.fill,
            strokeWidth: 1.5,
            activeDotColor: Color(0xFF613A00),
          )),
    );
  }
}
