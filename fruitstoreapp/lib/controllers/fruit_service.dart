import 'package:dio/dio.dart';
import 'package:fruitstoreapp/controllers/authentication_controller.dart';
import 'package:fruitstoreapp/models/fruit_models.dart';

class FruitService {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://192.168.1.11:3000/products';

  Future<List<Fruit>> getProducts() async {
    String? token = await getToken();
    final response = await _dio.get(_baseUrl,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return (response.data as List).map((json) => Fruit.fromJson(json)).toList();
  }

  Future<Fruit> createProduct(Map<String, dynamic> productData) async {
    String? token = await getToken();
    final response = await _dio.post(_baseUrl,
        data: productData,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return Fruit.fromJson(response.data);
  }

  Future<Fruit> updateProduct(int id, Map<String, dynamic> productData) async {
    String? token = await getToken();
    final response = await _dio.put('$_baseUrl/$id',
        data: productData,
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return Fruit.fromJson(response.data);
  }

  Future<void> deleteProduct(int id) async {
    String? token = await getToken();
    await _dio.delete('$_baseUrl/$id',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
  }
}
