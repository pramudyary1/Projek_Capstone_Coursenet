import 'package:flutter/material.dart';
import 'package:fruitstoreapp/controllers/category_service.dart';
import 'package:fruitstoreapp/models/category_models.dart';

class CategoryProvider with ChangeNotifier {
  final CategoryService _categoryService = CategoryService();
  List<Category> _categories = [];
  bool _isLoading = false;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();
    _categories = await _categoryService.getCategories();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> createCategory(Map<String, dynamic> categoryData) async {
    await _categoryService.createCategory(categoryData);
    fetchCategories();
  }
}
