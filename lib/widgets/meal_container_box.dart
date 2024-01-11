import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/context_extension.dart';
import 'package:recipe_app/data/get_meal_info_api.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/models/meals_meal_model.dart';
import 'package:recipe_app/screens/meals/meal_screen.dart';

Widget mealContainerBox(BuildContext context, MealModel model) {
  return Container(
    margin: context.dynamicAllPadding(.005, .01),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF6D454C), width: 2),
        borderRadius: context.borderRadiusValue),
    child: Padding(
      padding: context.dynamicAllPadding(0.01, 0.02),
      child: InkWell(
        onTap: () {
          GetMealInfoApi.getMealInfo(model.idMeal).then((response) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                model.strMealThumb.toString(),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      model.strMeal.toString(),
                      maxLines: 2,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    AutoSizeText(
                      model.strCategory.toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ]),
            )
          ],
        ),
      ),
    ),
  );
}
