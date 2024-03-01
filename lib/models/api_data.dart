import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiModels {
  Future getCategory() async {
    Uri url = Uri.parse('https://dummyjson.com/products/categories');
    http.Response response = await http.get(url);
    final data = jsonDecode(response.body);
    return data;
  }

  Future getProducts(String name) async {
    Uri url = Uri.parse('https://dummyjson.com/products/category/$name');
    http.Response response = await http.get(url);
    final products = jsonDecode(response.body);
    return products;
  }
}
