import 'package:flutter/material.dart';
import 'package:fruitstoreapp/controllers/fruit_service.dart';
import 'package:fruitstoreapp/models/fruit_models.dart';

class FruitProvider with ChangeNotifier {
  final FruitService _fruitService = FruitService();
  List<Fruit> _fruit = [];
  bool _isLoading = false;

  List<Fruit> get products => _fruit;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    _fruit = await _fruitService.getProducts();
    _isLoading = false;
    notifyListeners();
  }
  Future<void> createProduct(Map<String, dynamic> productData) async {
    await _fruitService.createProduct(productData);
    fetchProducts();
  }

  Future<void> updateProduct(int id, Map<String, dynamic> productData) async {
    await _fruitService.updateProduct(id, productData);
    fetchProducts();
  }

  Future<void> deleteProduct(int id) async {
    await _fruitService.deleteProduct(id);
    fetchProducts();
  }
}
