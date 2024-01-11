import 'package:recipe_app/models/categorie_meals_model.dart';

class MealsForCategoryModel {
  List<CategorieMealsModel>? meals;
  MealsForCategoryModel({this.meals});
  factory MealsForCategoryModel.fromJson(Map<String, dynamic> json) {
    return MealsForCategoryModel(
      meals: List<CategorieMealsModel>.from(json["meals"] != null
          ? json["meals"].map((x) => CategorieMealsModel.fromJson(x))
          : []),
    );
  }
}
