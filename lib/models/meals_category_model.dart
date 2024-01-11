import 'package:recipe_app/models/categories_model.dart';

class MealsCategoryModel {
  List<CategoriesModel>? categories;
  MealsCategoryModel({this.categories});
  factory MealsCategoryModel.fromJson(Map<String, dynamic> json) {
    return MealsCategoryModel(
      categories: List<CategoriesModel>.from(json["categories"] != null
          ? json["categories"].map((x) => CategoriesModel.fromJson(x))
          : []),
    );
  }
}
