import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/auth_service.dart';
import 'package:recipe_app/context_extension.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/storage/favorite_storage.dart';
import 'package:recipe_app/widgets/costum_app_bar.dart';

class MealScreen extends StatefulWidget {
  MealScreen({super.key, required this.mealModel});
  MealModel mealModel;
  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  bool openMateialText = true;
  bool openInstructionsText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: context.dynamicAllPadding(0.01, 0.02),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.dynamicHeight(0.2),
                child: buildMealNameInfo(context),
              ),
              buildMaterialTitle(),
              openMateialText
                  ? buildMateialInfo()
                  : const Divider(
                      color: Color.fromARGB(255, 143, 157, 158),
                    ),
              buildInstructionsTitle(),
              openInstructionsText
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          openMateialText = false;
                        });
                      },
                      child: Text(widget.mealModel.strInstructions))
                  : const Divider(
                      color: Color(0xFF00AFB9),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMaterialTitle() {
    return Container(
      margin: context.dynamicVerticalPadding(0.01),
      width: context.dynamicWidth(1),
      color: const Color(0xFF00AFB9),
      padding: context.dynamicHorizontalPadding(0.02),
      alignment: Alignment.centerLeft,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AutoSizeText(
              "Ingredients",
              minFontSize: 14,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    openMateialText = !openMateialText;
                  });
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }

  Widget buildInstructionsTitle() {
    return Container(
      margin: context.dynamicVerticalPadding(0.01),
      width: context.dynamicWidth(1),
      color: const Color(0xFF00AFB9),
      padding: context.dynamicHorizontalPadding(0.02),
      alignment: Alignment.centerLeft,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AutoSizeText(
              "Instructions",
              minFontSize: 14,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    openInstructionsText = !openInstructionsText;
                  });
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }

  Widget buildMateialInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        testMaterialText(
            widget.mealModel.strIngredient1, widget.mealModel.strMeasure1),
        testMaterialText(
            widget.mealModel.strIngredient2, widget.mealModel.strMeasure2),
        testMaterialText(
            widget.mealModel.strIngredient3, widget.mealModel.strMeasure3),
        testMaterialText(
            widget.mealModel.strIngredient4, widget.mealModel.strMeasure4),
        testMaterialText(
            widget.mealModel.strIngredient5, widget.mealModel.strMeasure5),
        testMaterialText(
            widget.mealModel.strIngredient6, widget.mealModel.strMeasure6),
        testMaterialText(
            widget.mealModel.strIngredient7, widget.mealModel.strMeasure7),
        testMaterialText(
            widget.mealModel.strIngredient8, widget.mealModel.strMeasure8),
        testMaterialText(
            widget.mealModel.strIngredient9, widget.mealModel.strMeasure9),
        testMaterialText(
            widget.mealModel.strIngredient10, widget.mealModel.strMeasure10),
        testMaterialText(
            widget.mealModel.strIngredient11, widget.mealModel.strMeasure11),
        testMaterialText(
            widget.mealModel.strIngredient12, widget.mealModel.strMeasure12),
        testMaterialText(
            widget.mealModel.strIngredient13, widget.mealModel.strMeasure13),
        testMaterialText(
            widget.mealModel.strIngredient14, widget.mealModel.strMeasure14),
        testMaterialText(
            widget.mealModel.strIngredient15, widget.mealModel.strMeasure15),
        testMaterialText(
            widget.mealModel.strIngredient16, widget.mealModel.strMeasure16),
        testMaterialText(
            widget.mealModel.strIngredient17, widget.mealModel.strMeasure17),
        testMaterialText(
            widget.mealModel.strIngredient18, widget.mealModel.strMeasure18),
        testMaterialText(
            widget.mealModel.strIngredient19, widget.mealModel.strMeasure19),
        testMaterialText(
            widget.mealModel.strIngredient20, widget.mealModel.strMeasure20),
      ],
    );
  }

  Widget testMaterialText(var ingredient, var measure) {
    if (strController(ingredient).isNotEmpty) {
      return Row(
        children: [
          const Icon(Icons.arrow_right_sharp),
          AutoSizeText(
              "${strController(ingredient)}/${strController(measure)}"),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget buildMealNameInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(widget.mealModel.strMealThumb))),
        SizedBox(
          width: context.dynamicWidth(0.02),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                widget.mealModel.strMeal,
                minFontSize: 18,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    widget.mealModel.strCategory,
                    minFontSize: 16,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        addFavoriteItem();
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: favoriteMealList.meals!
                                    .indexWhere((element) =>
                                        element.idMeal ==
                                        widget.mealModel.idMeal)
                                    .toInt() >=
                                0
                            ? Colors.red
                            : Colors.grey,
                      ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  void addFavoriteItem() {
    if (favoriteMealList.meals!
            .indexWhere((element) => element.idMeal == widget.mealModel.idMeal)
            .toInt() >=
        0) {
      setState(() {
        widget.mealModel.isFavorite = "false";
        favoriteMealList.meals!.removeAt(favoriteMealList.meals!
            .indexWhere((element) => element.idMeal == widget.mealModel.idMeal)
            .toInt());
        writeFavoriteList(favoriteMealList).then((value) {
          readFavoriteList().then((value) {
            setState(() {
              favoriteMealList.meals = value;
            });
          });
        });
      });
    } else {
      widget.mealModel.isFavorite = "true";
      favoriteMealList.meals!.add(widget.mealModel);
      writeFavoriteList(favoriteMealList).then((value) {
        readFavoriteList().then((value) {
          setState(() {
            favoriteMealList.meals = value;
          });
        });
      });
    }
  }
}
