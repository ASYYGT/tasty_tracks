import 'package:http/http.dart' as http;

class GetAllAreaApi {
  static Future getAllArea() {
    return http.get(
          Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?a=list'));
  }
}

