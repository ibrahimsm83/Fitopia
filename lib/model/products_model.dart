import 'package:easy_localization/easy_localization.dart';
import 'package:fitopia/presentation/resources/assets_manager.dart';
import 'package:fitopia/translations/locale_keys.g.dart';

class HomeProducts {
  String? imagePath;
  String? title;
  HomeProducts({this.title, this.imagePath});
}

List<HomeProducts> HomeProductsList = [
  HomeProducts(
      title: LocaleKeys.PhysioStep.tr(), imagePath: ImageAssets.productsImage3),
  HomeProducts(
      title: LocaleKeys.CardioStep.tr(), imagePath: ImageAssets.productsImage2),
  HomeProducts(
      title: LocaleKeys.CyclePlus.tr(), imagePath: ImageAssets.productsImage1),
      HomeProducts(
      title: LocaleKeys.PhysioStep.tr(), imagePath: ImageAssets.productsImage3),
];
