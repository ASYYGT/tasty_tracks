import 'package:http/http.dart' as http;

class GetAllCategoriesApi {
  static Future getAllCategories() {
    return http.get(
          Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
  }
}

