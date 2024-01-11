import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/context_extension.dart';
import 'package:recipe_app/data/get_all_categories_api.dart';
import 'package:recipe_app/data/get_meals_for_categories_api.dart';
import 'package:recipe_app/models/categorie_meals_model.dart';
import 'package:recipe_app/models/categories_model.dart';
import 'package:recipe_app/models/meals_category_model.dart';
import 'package:recipe_app/models/meals_for_category_model.dart';
import 'package:recipe_app/screens/meals/meals_list_screen.dart';
import 'package:recipe_app/widgets/build_circular_progress_indicator.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<CategoriesModel> categoriesList = [];
  MealsCategoryModel categoryMeal = MealsCategoryModel();
  List<CategorieMealsModel> categorieMealsModel = [];

  getAllCategories() {
    GetAllCategoriesApi.getAllCategories().then((response) {
      if (response.statusCode == 200) {
        setState(() {
          categoryMeal =
              MealsCategoryModel.fromJson(json.decode(response.body));
          categoriesList = categoryMeal.categories!;
        });
      } else {
        setState(() {
          categoriesList = [];
          throw Exception('Failed to load categories');
        });
      }
    });
  }

  void ontapBox(String category) {
    getMealsForCategorie(category).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MealsListScreen(categorieMealsModel: categorieMealsModel),
          ));
    });
  }

  Future<void> getMealsForCategorie(String categorie) async {
    await GetMealsForCategoriesApi.getMealsForCategories(categorie)
        .then((response) {
      if (response.statusCode == 200) {
        MealsForCategoryModel mealsForCategoryModel =
            MealsForCategoryModel.fromJson(json.decode(response.body));
        categorieMealsModel = mealsForCategoryModel.meals!;
      } else {
        categorieMealsModel = [];
      }
    });
  }

  @override
  void didChangeDependencies() {
    getAllCategories();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: categoriesList.isNotEmpty
          ? Padding(
              padding: context.dynamicAllPadding(0.01, 0.02),
              child: ListView.builder(
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  return buildListItem(index);
                },
              ),
            )
          : buildCircularProgressIndicator(),
    );
  }

  Widget buildListItem(int index) {
    return Padding(
      padding: context.dynamicVerticalPadding(0.005),
      child: ListTile(
        onTap: () {
          ontapBox(categoriesList[index].strCategory.toString());
        },
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFF6D454C), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        leading:
            Image.network(categoriesList[index].strCategoryThumb.toString()),
        title: AutoSizeText(categoriesList[index].strCategory.toString()),
        trailing: const Icon(
          Icons.navigate_next_outlined,
          color: Color(0xFF00AFB9),
        ),
      ),
    );
  }
}
