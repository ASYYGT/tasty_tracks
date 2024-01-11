import 'package:http/http.dart' as http;

class GetRandomMealApi {
  static Future getRandomMeal() {
    return http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php'));
  }
}

