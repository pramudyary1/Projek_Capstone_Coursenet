import 'package:flutter/material.dart';
import 'package:fruitstoreapp/controllers/authentication_controller.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () => checkAuthentication());
  }

  Future checkAuthentication() async {
    context.read<AuthenticationController>();
    String? token = await getToken();
    if (token != null) {
      Navigator.pushReplacementNamed(context, '/navigation');
    } else {
      Navigator.pushReplacementNamed(context, '/authentication');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/fruitHouse(noBG).png",
              height: 280,
            ),
          )
        ],
      ),
    );
  }
}
