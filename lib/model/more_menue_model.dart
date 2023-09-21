import 'package:fitopia/presentation/resources/assets_manager.dart';
import 'package:fitopia/presentation/resources/strings_manager.dart';

class MoreModel {
  int id;
  String? title;
  String? iconPath;

  MoreModel({this.id = 0, this.title, this.iconPath});
}

List<MoreModel> moreList = [
  MoreModel(id: 0,title: AppStrings.myProfile,iconPath: ImageAssets.myProfileIcon),
  MoreModel(id: 1,title: AppStrings.myPrograms,iconPath: ImageAssets.myProgramsIcon),
  MoreModel(id: 2,title: AppStrings.myMealPlans,iconPath: ImageAssets.myMealPlansIcon),
  MoreModel(id: 3,title: AppStrings.recipeList,iconPath: ImageAssets.receipeListIcon),
  MoreModel(id: 4,title: AppStrings.workoutRoutine,iconPath: ImageAssets.workoutRoutineIcon),
  MoreModel(id: 5,title: AppStrings.nutrition,iconPath: ImageAssets.nutritionIcon),
  MoreModel(id: 6,title: AppStrings.eBooks,iconPath: ImageAssets.ebookIcon),
  MoreModel(id: 7,title: AppStrings.settings,iconPath: ImageAssets.settingsIcon),
  MoreModel(id: 7,title: AppStrings.chat,iconPath: ImageAssets.chatIcon),
  MoreModel(id: 7,title: AppStrings.help,iconPath: ImageAssets.helpIcon),
  MoreModel(id: 7,title: AppStrings.logout,iconPath: ImageAssets.logoutIcon),
];
