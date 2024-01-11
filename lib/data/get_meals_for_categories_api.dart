import 'package:http/http.dart' as http;

class GetMealsForCategoriesApi {
  static Future getMealsForCategories(String categorieName) {
    return http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$categorieName'));
  }
}
