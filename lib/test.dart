import 'package:bai_tap_lon/Model/Product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static var client = http.Client();

  static Future<List<Product>?> fetchCat() async {
    var response =
    await client.get(Uri.parse('http://localhost:5001/api/cocktails'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return (json.decode(jsonString) as List)
          .map((i) => Product.fromJson(i))
          .toList();
    } else {
      // Xử lý lỗi
      return null;
    }
  }
}

