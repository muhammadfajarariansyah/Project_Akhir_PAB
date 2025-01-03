import 'package:flutter/material.dart';

import 'package:project_akhir/screens/favorite_screen.dart';
import 'package:project_akhir/screens/home_screen.dart';
import 'package:project_akhir/screens/profile_screen.dart';
import 'package:project_akhir/screens/search_screen.dart';
import 'package:project_akhir/screens/signup_screen.dart';
import 'package:project_akhir/screens/signin_screen.dart';



void main() {
  runApp(const TugasinApp());
}

class TugasinApp extends StatelessWidget {
  const TugasinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/favorite': (context) => FavoriteScreen(),
        '/profile': (context) => ProfileScreen(),
        '/search': (context) => SearchScreen(),
      },
    );
  }
}
