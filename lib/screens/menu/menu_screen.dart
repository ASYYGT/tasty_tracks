import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/data/get_random_meal_api.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/screens/categoryies/categories_screen.dart';
import 'package:recipe_app/screens/favorite/favorite_screen.dart';
import 'package:recipe_app/screens/menu/menu_screen_body.dart';
import 'package:recipe_app/storage/favorite_storage.dart';
import 'package:recipe_app/widgets/main_app_bar.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({super.key, required this.mealList});
  List<MealModel> mealList;
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int screenIndex = 0;
  @override
  void didChangeDependencies() {
    GetRandomMealApi.getRandomMeal().then((respone) {
      respone.body;
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    screenIndex = 1;
    readFavoriteList().then((value) {
      favoriteMealList.meals = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const CategoriesScreen(),
      MenuScreenBody(mealList: widget.mealList),
      const FavoriteScreen()
    ];
    return Scaffold(
      appBar: buildMainAppBar(),
      bottomNavigationBar: buildMainBottomNavigationBar(),
      body: screens[screenIndex],
    );
  }

  ConvexAppBar buildMainBottomNavigationBar() {
    return ConvexAppBar(
      backgroundColor: const Color(0xFFDD6010),
      color: Colors.white,
      initialActiveIndex: 1,
      items: const [
        TabItem(icon: Icons.category, title: 'Categorie'),
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.favorite, title: 'Favorite'),
      ],
      onTap: (int i) {
        setState(() {
          screenIndex = i;
        });
      },
    );
  }
}
