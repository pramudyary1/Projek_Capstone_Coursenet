import 'package:dio/dio.dart';
import 'package:fruitstoreapp/controllers/authentication_controller.dart';
import 'package:fruitstoreapp/models/user_models.dart';
import 'package:path/path.dart' as path;

class UserService {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://192.168.1.11:3000/user';

  Future<User> fetchUserProfile() async {
    try {
      String? token = await getToken();
      final response = await _dio.get(
        '$_baseUrl/profile',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      print('Response data: ${response.data}');
      return User.fromJson(response.data);
    } catch (e) {
      print('Error fetching profile: $e');
      throw Exception('Failed to load profile');
    }
  }

  Future<User> uploadImage(String filePath) async {
    try {
      String? token = await getToken();
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath,
            filename: path.basename(filePath!)),
      });
      final response = await _dio.patch(
        '$_baseUrl/upload',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      print('Response data: ${response.data}');
      return User.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        print('Dio error: ${e.response?.data}');
      } else {
        print('Error uploading image: $e');
      }
      throw Exception('Failed to upload image');
    }
  }
}
