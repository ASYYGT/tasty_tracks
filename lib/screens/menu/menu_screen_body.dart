import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:recipe_app/context_extension.dart';
import 'package:recipe_app/data/get_meal_info_api.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/models/meals_meal_model.dart';
import 'package:recipe_app/screens/meals/meal_screen.dart';
import 'package:recipe_app/widgets/meal_container_box.dart';

class MenuScreenBody extends StatefulWidget {
  MenuScreenBody({super.key, required this.mealList});
  List<MealModel> mealList;
  @override
  State<MenuScreenBody> createState() => _MenuScreenBodyState();
}

class _MenuScreenBodyState extends State<MenuScreenBody> {
  List<CarouselItem> itemList = [
    CarouselItem(
      image: const AssetImage(
        'assets/images/menu_image_1.png',
      ),
    ),
    CarouselItem(
      image: const AssetImage(
        'assets/images/menu_image_2.png',
      ),
    ),
    CarouselItem(
      image: const AssetImage(
        'assets/images/menu_image_3.png',
      ),
    ),
  ];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: buildImagesBox(),
            ),
            const Divider(
              color: Color(0xFF00AFB9),
            ),
            buildMenuTitle(),
            const Divider(
              color: Color(0xFF00AFB9),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                itemCount: widget.mealList.length,
                itemBuilder: (context, index) {
                  return mealContainerBox(context, widget.mealList[index]);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
            )
          ],
        ));
  }

  Widget buildImagesBox() {
    return CustomCarouselSlider(
      items: itemList,
      width: context.dynamicWidth(1),
      autoplay: true,
      selectedDotColor: const Color(0xFF00AFB9),
      showSubBackground: false,
      autoplayDuration: const Duration(seconds: 7),
      showText: false,
    );
  }

  Widget buildMenuTitle() {
    return Container(
      height: context.dynamicHeight(0.05),
      width: context.dynamicWidth(1),
      color: const Color(0xFF00AFB9),
      padding: context.dynamicHorizontalPadding(0.02),
      alignment: Alignment.centerLeft,
      child: const AutoSizeText(
        "Recommended For You",
        minFontSize: 18,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
