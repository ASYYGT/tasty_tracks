class CategoriesModel {
  dynamic idCategory;
  dynamic strCategory;
  dynamic strCategoryDescription;
  dynamic strCategoryThumb;
  CategoriesModel(
      {this.strCategory,
      this.idCategory,
      this.strCategoryDescription,
      this.strCategoryThumb});
  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      strCategory: json["strCategory"],
      idCategory: json["idCategory"],
      strCategoryDescription: json["strCategoryDescription"],
      strCategoryThumb: json["strCategoryThumb"],
    );
  }
  Map<String, dynamic> toJson() => {
        "strCategory": strCategory,
        "idCategory": idCategory,
        "strCategoryDescription": strCategoryDescription,
        "strCategoryThumb": strCategoryThumb
      };
}
