import 'package:http/http.dart' as http;

class GetAllIngredientsApi {
  static Future getAllIngredients() {
    return http.get(
          Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?i=list'));
  }
}

