import 'package:flutter/material.dart';
import 'package:fruitstoreapp/controllers/user_service.dart';
import 'package:fruitstoreapp/models/user_models.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final UserService _userService = UserService();

  User? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  Future<void> fetchUserProfile() async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();
    try {
      _user = await _userService.fetchUserProfile();
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> uploadImage(String filePath) async {
    _isLoading = true;
    notifyListeners();
    try {
      final updatedUser = await _userService.uploadImage(filePath);
      _user?.image = updatedUser.image;
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
