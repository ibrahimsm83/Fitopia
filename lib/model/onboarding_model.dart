import 'package:fitopia/presentation/resources/index_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fitopia/translations/locale_keys.g.dart';

class onBoradingModel {
  int? id;
  String? leading;
  String? title;
  String? description;

  onBoradingModel({this.id, this.leading, this.title, this.description});
}

///Goal list
List<onBoradingModel>? goalList = [
  onBoradingModel(
    id: 0,
    title: LocaleKeys.loseWeight.tr(), //AppStrings.loseWeight,
    description: LocaleKeys.getLeanerImproveFitness
        .tr(), //AppStrings.getLeanerImproveFitness
  ),
  onBoradingModel(
    id: 1,
    title: LocaleKeys.Leanbulk.tr(), //AppStrings.Leanbulk,
    description: LocaleKeys.buildYourStrengthMuscles
        .tr(), //AppStrings.buildYourStrengthMuscles
  ),
  onBoradingModel(
    id: 2,
    title: LocaleKeys.Gainweight.tr(), //AppStrings.Gainweight,
    description: LocaleKeys.eatTrainOptimumHealth
        .tr(), //AppStrings.eatTrainOptimumHealth
  ),
];

///Dietry Requirments
List<onBoradingModel>? DietryRequirmentList = [
  onBoradingModel(
    id: 0,
    title: LocaleKeys.Standard.tr(), //AppStrings.Standard,
    description: LocaleKeys.Ieateverything.tr(), //AppStrings.Ieateverything
  ),
  onBoradingModel(
    id: 1,
    title: LocaleKeys.Vegetarian.tr(), //AppStrings.Vegetarian,
    // description: AppStrings.buildYourStrengthMuscles
  ),
  onBoradingModel(
    id: 2,
    title: LocaleKeys.Vegan.tr(), //AppStrings.Vegan,
    //description: AppStrings.eatTrainOptimumHealth
  ),
];

///How active are you
List<onBoradingModel>? HowActiveAreYouList = [
  onBoradingModel(
    id: 0,
    title: LocaleKeys.Sedentary.tr(), // AppStrings.Sedentary,
    description: LocaleKeys.egDeskJob.tr(), //AppStrings.egDeskJob
  ),
  onBoradingModel(
    id: 1,
    title: LocaleKeys.LightlyActive.tr(), //AppStrings.LightlyActive,
    description: LocaleKeys.egmoderatedaily.tr(), //AppStrings.egDlightdaily
  ),
  onBoradingModel(
    id: 2,
    title: LocaleKeys.ModeratelyActive.tr(), //AppStrings.ModeratelyActive,
    description: LocaleKeys.egmoderatedaily.tr(), // AppStrings.egmoderatedaily
  ),
  onBoradingModel(
    id: 3,
    title: LocaleKeys.Veryactive.tr(), //AppStrings.Veryactive,
    description: LocaleKeys.egphysicallydemanding
        .tr(), //AppStrings.egphysicallydemanding
  ),
  onBoradingModel(
    id: 4,
    title: LocaleKeys.Extremelyactive.tr(), //AppStrings.Extremelyactive,
    description: LocaleKeys.egAthleteIn.tr(), //AppStrings.egAthleteIn
  ),
];

///MaleFemale
List<onBoradingModel>? genderList = [
  onBoradingModel(
    id: 0,
    title: LocaleKeys.male1.tr(), //"Male",//AppStrings.male,
  ),
  onBoradingModel(
    id: 1,
    title: LocaleKeys.female1.tr(), //"Female",// AppStrings.female,
  ),
];

///MaleFemale
List<onBoradingModel>? maleSpecificPlanList = [
  onBoradingModel(
    id: 0,
    title: LocaleKeys.yes.tr(), //"Yes",
  ),
  onBoradingModel(
    id: 1,
    title: LocaleKeys.no.tr(), //"No",
  ),
];

class onboardingImageTitle {
  String? imagePath;
  String? title;
  onboardingImageTitle(this.imagePath, this.title);
}

List<onboardingImageTitle> OnboardingImgTitle = [
  onboardingImageTitle(ImageAssets.onboarding1, LocaleKeys.whatsyourgoal.tr()),
  onboardingImageTitle(
      ImageAssets.onboarding2, LocaleKeys.WhatAreYourDietaryrequirements.tr()),
  onboardingImageTitle(
      ImageAssets.onboarding3, LocaleKeys.Howactiveareyou.tr()),
  onboardingImageTitle(
      ImageAssets.onboarding4, LocaleKeys.WhatGenderdoYouidentityAs.tr()),
        onboardingImageTitle(
      ImageAssets.onboarding3, LocaleKeys.doyouwanttofemaleSpecificplan.tr()),
        onboardingImageTitle(
      ImageAssets.onboarding3, LocaleKeys.howOldAreYou.tr()),
];
