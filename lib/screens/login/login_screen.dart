import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_app/data/get_random_meal_api.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/models/meals_meal_model.dart';
import 'package:recipe_app/screens/menu/menu_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<MealModel> mealList = [];
  Future<void> getRandomMeal() async {
    for (int i = 0; i < 10; i++) {
      await GetRandomMealApi.getRandomMeal().then((response) {
        bool isAdd = true;
        if (response.statusCode == 200) {
          MealsMealModel data =
              MealsMealModel.fromJson(json.decode(response.body));
          for (var item in mealList) {
            if (item.idMeal == data.meals![0].idMeal) {
              isAdd = false;
              i--;
              break;
            }
          }
          if (isAdd) {
            mealList.add(data.meals![0]);
          } else {
            isAdd = true;
          }
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    getRandomMeal().then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MenuScreen(
                mealList: mealList,
              )));
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/images/login.png",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
