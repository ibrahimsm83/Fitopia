import 'package:fitopia/presentation/resources/assets_manager.dart';
import 'package:flutter/scheduler.dart';

class weekDaysModel {
  int? id;
  String? day;
  String? date;

  weekDaysModel({this.id, this.day, this.date});
}

///WeekDays
List<weekDaysModel>? weekDaysList = [
  weekDaysModel(id: 0, day: "M", date: "17"),
  weekDaysModel(id: 1, day: "T", date: "18"),
  weekDaysModel(id: 2, day: "W", date: "19"),
  weekDaysModel(id: 3, day: "T", date: "20"),
  weekDaysModel(id: 4, day: "F", date: "21"),
  weekDaysModel(id: 5, day: "S", date: "22"),
  weekDaysModel(id: 6, day: "S", date: "23"),
];

///Products
class ProductsModel {
  int? id;
  String? title;
  String? subtitle;
  String? description;
  String? ImagePath;
  ProductsModel(
      {this.id, this.title, this.subtitle, this.description, this.ImagePath});
}

List<ProductsModel>? mealsList = [
  ProductsModel(id: 0,title: "Breakfast",subtitle: "Pesto Eggs with Toast",description: "15 Min",ImagePath: ImageAssets.mealsImage1),
  ProductsModel(id: 1,title: "Lunch",subtitle: "Leftovers",description: "15 Min",ImagePath: ImageAssets.mealsImage2),
  ProductsModel(id: 2,title: "Post Workout Meal",subtitle: "Green Super Smoothie",description: "5 Min,  Sergio Perera",ImagePath: ImageAssets.mealsImage3),
  ProductsModel(id: 3,title: "Dinner",subtitle: "One-pan Fish with beans & Tomatoes",description: "25 Min",ImagePath: ImageAssets.mealsImage4),

];
