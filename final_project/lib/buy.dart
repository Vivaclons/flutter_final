import 'package:flutter/material.dart';

class BuyApp extends ChangeNotifier {
  final List<String> _basketAdd = [];
  List<String> get basketAdd => basketAdd;

  addProduct(String name) {
    _basketAdd.add(name);
    notifyListeners();
  }

  removeProduct(String name) {
    _basketAdd.removeWhere((element) => element == name);
    notifyListeners();
  }
}
