import 'package:fitopia/presentation/resources/index_manager.dart';

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
        title: AppStrings.loseWeight,
        description: AppStrings.getLeanerImproveFitness),
    onBoradingModel(
      id: 1,
        title: AppStrings.Leanbulk,
        description: AppStrings.buildYourStrengthMuscles),
    onBoradingModel(
      id: 2,
        title: AppStrings.Gainweight,
        description: AppStrings.eatTrainOptimumHealth),
  ];

///Dietry Requirments
List<onBoradingModel>? DietryRequirmentList = [
    onBoradingModel(
      id: 0,
        title: AppStrings.Standard,
        description: AppStrings.Ieateverything),
    onBoradingModel(
      id: 1,
        title: AppStrings.Vegetarian,
       // description: AppStrings.buildYourStrengthMuscles
        ),
    onBoradingModel(
      id: 2,
        title: AppStrings.Vegan,
        //description: AppStrings.eatTrainOptimumHealth
        ),
  ];

  ///How active are you
List<onBoradingModel>? HowActiveAreYouList = [
    onBoradingModel(
      id: 0,
        title: AppStrings.Sedentary,
        description: AppStrings.egDeskJob),
    onBoradingModel(
      id: 1,
        title: AppStrings.LightlyActive,
       description: AppStrings.egDlightdaily
        ),
    onBoradingModel(
      id: 2,
        title: AppStrings.ModeratelyActive,
        description: AppStrings.egmoderatedaily
        ),
    onBoradingModel(
      id: 3,
        title: AppStrings.Veryactive,
        description: AppStrings.egphysicallydemanding
        ),
    onBoradingModel(
      id: 4,
        title: AppStrings.Extremelyactive,
        description: AppStrings.egAthleteIn
        ),
  ];

  ///MaleFemale
  List<onBoradingModel>? genderList = [
    onBoradingModel(
      id: 0,
        title: AppStrings.male,
       ),
    onBoradingModel(
      id: 1,
        title: AppStrings.female,
      ),
  
  ];

  class onboardingImageTitle{
    String? imagePath;
    String? title;
    onboardingImageTitle(this.imagePath,this.title);
  }

  List<onboardingImageTitle> OnboardingImgTitle=[
    onboardingImageTitle( ImageAssets.onboarding1,AppStrings.whatsyourgoal),
    onboardingImageTitle( ImageAssets.onboarding2,AppStrings.WhatAreYourDietaryrequirements),
    onboardingImageTitle( ImageAssets.onboarding3,AppStrings.Howactiveareyou),
    onboardingImageTitle( ImageAssets.onboarding4,AppStrings.WhatGenderdoYouidentityAs),
  ];