import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/models/meals_meal_model.dart';

MealsMealModel favoriteMealList = MealsMealModel();
Future<List<MealModel>> readFavoriteList() async {
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;
  MealsMealModel mealsList;
  try {
    final file = File('$path/favorite.txt');
    final meals = await file.readAsString();
    mealsList = MealsMealModel.fromJson(jsonDecode(meals));
    return mealsList.meals!;
  } catch (e) {
    return [];
  }
}

Future<File> writeFavoriteList(MealsMealModel meals) async {
  final directory = await getApplicationDocumentsDirectory();
  final path = directory.path;
  final file = File('$path/favorite.txt');
  return file.writeAsString(json.encode(meals.toJson()).toString());
}
