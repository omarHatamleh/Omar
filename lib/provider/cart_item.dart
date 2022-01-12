
import 'package:coffee_store_ui/models/Products.dart';
import 'package:coffee_store_ui/models/coffee.dart';
import 'package:flutter/cupertino.dart';

class CartItem extends ChangeNotifier {
  List<Coffee> products = [];

  addProduct(Coffee product) {
    products.add(product);
    notifyListeners();
  }

  deleteProduct(Coffee product) {
    products.remove(product);
    notifyListeners();
  }
}