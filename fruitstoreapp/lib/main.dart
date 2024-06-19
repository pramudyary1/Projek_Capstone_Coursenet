// main.dart

import 'package:flutter/material.dart';
import 'package:fruitstoreapp/controllers/authentication_controller.dart';
import 'package:fruitstoreapp/controllers/category_provider.dart';
import 'package:fruitstoreapp/controllers/fruit_provider.dart';
import 'package:fruitstoreapp/controllers/user_provider.dart';
import 'package:fruitstoreapp/views/AddCategoryPage.dart';
import 'package:fruitstoreapp/views/Authentication.dart';
import 'package:fruitstoreapp/views/BottomNavigation.dart';
import 'package:fruitstoreapp/views/EditFruitPage.dart';
import 'package:fruitstoreapp/views/SplashScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationController()),
        ChangeNotifierProvider(create: (_) => FruitProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => NavigationController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fruit Store App',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: GoogleFonts.poppins().toString(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        // routes: {
        //   '/' : (context) => Splashscreen(),
        //   '/authentication' : (context) => Authentication(),
        //   '/homepage' : (context) => BottomNavigation(),
        //   '/addCategory' : (context) => AddcategoryPage(),
        //   '/editFruitPage' : (context) => EditfruitPage(),
        // },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (context) => const Splashscreen());
            case '/authentication':
              return MaterialPageRoute(
                  builder: (context) => const Authentication());
            case '/homepage':
              return MaterialPageRoute(
                  builder: (context) => BottomNavigation());
            case '/navigation':
              return MaterialPageRoute(
                  builder: (context) => BottomNavigation());
            case '/addcategory':
              return MaterialPageRoute(builder: (context) => AddcategoryPage());
            case '/editFruitPage':
              final productId = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (context) => EditfruitPage(productId: productId));
            default:
              return null;
          }
        },
      ),
    );
  }
}
