import 'dart:convert';

import 'package:getx_use_api/api_modal/modal.dart';
import 'package:http/http.dart' as http;

class Apiservice {
  static Future<List<ProductsModel>> getUser() async {
    http.Response response = await http.get(
      Uri.parse(
          "https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie"),
    );
    print(response.body);
    return productsModelFromJson(response.body);
  }
}
