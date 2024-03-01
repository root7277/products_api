import 'package:flutter/material.dart';
import 'package:provider_state_managnment/models/api_data.dart';
import 'package:provider_state_managnment/models/products/products_model.dart';
import 'package:provider_state_managnment/ui/user.dart';

class ProviderModel extends ChangeNotifier {
  ApiModels apiModels = ApiModels();
  List<ProductsModel> products = [];
  List category = [];
  List<User> users = [];

  Future getAllCategory() async {
    final products = await apiModels.getCategory();
    products.forEach((e) {
      category.add(e);
    });
    notifyListeners();
  }

  Future getAllProducts(String productName) async {
    final data = await apiModels.getProducts(productName);
    products.add(ProductsModel.fromJson(data));
    notifyListeners();
  }

  void getAddUser(User user) {
    users.add(user);
    notifyListeners();
  }
}
