import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends ChangeNotifier {
  final formKeyLogin = GlobalKey<FormState>();
  final formKeyRegister = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  String? jwtToken;

  Future<void> register(BuildContext context) async {
    if (formKeyRegister.currentState!.validate()) {
      try {
        var requestModel = {
          'username': usernameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        };
        Response response = await Dio().post(
          'http://192.168.1.11:3000/authentication/register',
          data: requestModel,
        );

        if (response.statusCode == 200) {
          _showSuccessDialog(context, "Registration Successful",
              "Your email has been registered");
        } else {
          _showErrorDialog(
              context, response.data['message'] ?? 'Unknown error');
        }
      } catch (e) {
        if (e is DioException && e.response != null) {
          _showErrorDialog(
              context, e.response?.data['message'] ?? 'Unknown error');
        } else {
          _showErrorDialog(context, 'An unexpected error occurred.');
        }
        print('Error during registration: $e');
      }
    }
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    if (formKeyLogin.currentState!.validate()) {
      try {
        var requestModel = {
          'email': emailController.text,
          'password': passwordController.text,
        };
        Response response = await Dio().post(
          'http://192.168.1.11:3000/authentication/login',
          data: requestModel,
        );

        if (response.statusCode == 200) {
          jwtToken = response.data['accessToken'];
          await saveToken(jwtToken!);
          var datas = response.data['user'];

          _showSuccessDialog(context, "Login Successful", "Welcome back!");

          Navigator.of(context).pushNamedAndRemoveUntil(
              '/navigation', arguments: datas, (route) => false);
        } else {
          _showErrorDialog(
              context, response.data['message'] ?? 'Unknown error');
        }
      } catch (e) {
        if (e is DioException && e.response != null) {
          _showErrorDialog(
              context, e.response?.data['message'] ?? 'Unknown error');
        } else {
          _showErrorDialog(context, 'An unexpected error occurred.');
        }
        print("Error during login: $e");
      }
    }
  }

  void actionObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void _showSuccessDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Continue"),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Back"),
            ),
          ],
        );
      },
    );
  }
}

Future<void> saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('jwt_token', token);
}

Future<void> logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('jwt_token');
  Navigator.of(context)
      .pushNamedAndRemoveUntil('/authentication', (route) => false);
}

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('jwt_token');
}
