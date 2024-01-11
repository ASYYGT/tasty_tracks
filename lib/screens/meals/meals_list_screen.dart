import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/context_extension.dart';
import 'package:recipe_app/data/get_meal_info_api.dart';
import 'package:recipe_app/models/categorie_meals_model.dart';
import 'package:recipe_app/models/meals_meal_model.dart';
import 'package:recipe_app/screens/meals/meal_screen.dart';
import 'package:recipe_app/widgets/costum_app_bar.dart';

class MealsListScreen extends StatefulWidget {
  MealsListScreen({super.key, required this.categorieMealsModel});
  List<CategorieMealsModel> categorieMealsModel;
  @override
  State<MealsListScreen> createState() => _MealsListScreenState();
}

class _MealsListScreenState extends State<MealsListScreen> {
  List<CategorieMealsModel> searchCategorieMealsModel = [];
  TextEditingController mealController = TextEditingController();
  void searcMeal(String searchMale) {
    final suggestions = widget.categorieMealsModel.where((meal) {
      final titleLower = meal.strMeal.toLowerCase();
      final searchLower = mealController.text.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();
    setState(() => searchCategorieMealsModel = suggestions);
  }

  @override
  void initState() {
    searchCategorieMealsModel = widget.categorieMealsModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Column(
        children: [
          Padding(
            padding: context.dynamicAllPadding(0.01, 0.02),
            child: TextField(
              controller: mealController,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF00AFB9),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF6D454C), width: 2),
                ),
                hintText: 'Search Meal',
              ),
              onChanged: searcMeal,
            ),
          ),
          Flexible(
            child: GridView.builder(
              itemCount: searchCategorieMealsModel.length,
              itemBuilder: (context, index) {
                return buildItemContainer(index, false);
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemContainer(int index, bool isFavorite) {
    return InkWell(
      onTap: () {
        GetMealInfoApi.getMealInfo(searchCategorieMealsModel[index].idMeal)
            .then((response) {
          if (response.statusCode == 200) {
            MealsMealModel data =
                MealsMealModel.fromJson(json.decode(response.body));
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MealScreen(mealModel: data.meals![0]),
                ));
          }
        });
      },
      child: Container(
        margin: context.dynamicAllPadding(.005, .01),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xFF6D454C), width: 2),
            borderRadius: context.borderRadiusValue),
        child: Padding(
          padding: context.dynamicAllPadding(0.01, 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(flex: 2, child: buildImageBox(index)),
              Expanded(
                child: builMealNameBox(index),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget builMealNameBox(int index) {
    return Center(
      child: AutoSizeText(
        searchCategorieMealsModel[index].strMeal.toString(),
        maxLines: 1,
        textAlign: TextAlign.center,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildImageBox(int index) {
    return Image.network(
      searchCategorieMealsModel[index].strMealThumb.toString(),
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
