import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/context_extension.dart';
import 'package:recipe_app/data/get_meal_info_api.dart';
import 'package:recipe_app/models/meals_meal_model.dart';
import 'package:recipe_app/screens/meals/meal_screen.dart';
import 'package:recipe_app/storage/favorite_storage.dart';
import 'package:recipe_app/widgets/meal_container_box.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void didChangeDependencies() {
    readFavoriteList().then((value) {
      setState(() {
        favoriteMealList.meals = value;
      });
    });
    super.didChangeDependencies();
  }

  void onTapMealBox(String mealId) {
    GetMealInfoApi.getMealInfo(mealId).then((response) {
      if (response.statusCode == 200) {
        MealsMealModel data =
            MealsMealModel.fromJson(json.decode(response.body));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MealScreen(mealModel: data.meals![0]),
            )).then((value) {
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: favoriteMealList.meals!.isNotEmpty
            ? Column(
                children: [
                  Flexible(
                    child: GridView.builder(
                      itemCount: favoriteMealList.meals!.length,
                      itemBuilder: (context, index) {
                        return mealContainerBox(
                            context, favoriteMealList.meals![index]);
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ),
                  )
                ],
              )
            : Center(
                child: buildEmptyDesign(),
              ));
  }

  Widget buildEmptyDesign() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.favorite,
          color: Colors.redAccent.withOpacity(0.25),
          size: 100,
        ),
        AutoSizeText(
          "Favorite",
          style: TextStyle(
              color: Colors.blueGrey.withOpacity(0.5),
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
