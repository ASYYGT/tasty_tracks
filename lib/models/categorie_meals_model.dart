class CategorieMealsModel {
  dynamic strMeal;
  dynamic strMealThumb;
  dynamic idMeal;
  CategorieMealsModel({this.strMeal, this.strMealThumb, this.idMeal});

  factory CategorieMealsModel.fromJson(Map<String, dynamic> json) {
    return CategorieMealsModel(
      idMeal: json["idMeal"],
      strMeal: json["strMeal"],
      strMealThumb: json["strMealThumb"],
    );
  }
  Map<String, dynamic> toJson() =>
      {"idMeal": idMeal, "strMeal": strMeal, "strMealThumb": strMealThumb};
}
