import 'package:dio/dio.dart';
import 'package:fruitstoreapp/controllers/authentication_controller.dart';
import 'package:fruitstoreapp/models/category_models.dart';

class CategoryService {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://192.168.1.11:3000/categories';

  Future<List<Category>> getCategories() async {
    String? token = await getToken();
    final response = await _dio.get(_baseUrl,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return (response.data as List)
        .map((json) => Category.fromJson(json))
        .toList();
  }

  Future<Category> createCategory(Map<String, dynamic> categoryData) async {
    String? token = await getToken();
    final response = await _dio.post(_baseUrl,
        data: categoryData,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return Category.fromJson(response.data);
  }
}
