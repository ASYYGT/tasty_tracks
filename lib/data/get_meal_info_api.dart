import 'package:http/http.dart' as http;

class GetMealInfoApi {
  static Future getMealInfo(String mealId) {
    return http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId'));
  }
}
