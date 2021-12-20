import 'package:flutter/material.dart';

class BuyApp extends ChangeNotifier {
  final List<String> _basketAdd = [];
  List<String> get basketAdd => _basketAdd;

  addProduct(String name) {
    _basketAdd.add(name);
    notifyListeners();
  }

  price(String price) {
    _basketAdd.add(price);
    notifyListeners();
  }

  removeProduct(String name) {
    _basketAdd.removeWhere((element) => element == name);
    notifyListeners();
  }
}
