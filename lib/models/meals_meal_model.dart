import 'package:recipe_app/models/meal_model.dart';

class MealsMealModel {
  List<MealModel>? meals;
  MealsMealModel({this.meals});
  factory MealsMealModel.fromJson(Map<String, dynamic> json) {
    return MealsMealModel(
      meals: List<MealModel>.from(json["meals"] != null
          ? json["meals"].map((x) => MealModel.fromJson(x))
          : []),
    );
  }
  Map<String, dynamic> toJson() => {"meals": meals};
}
