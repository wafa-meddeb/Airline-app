

import 'package:airline_app/Screens/Welcome/Welcome_screen.dart';
import 'package:airline_app/Screens/bookingScreen/bookingScreen.dart';
import 'package:airline_app/constants.dart';
import 'package:flutter/material.dart';

import 'components/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}

