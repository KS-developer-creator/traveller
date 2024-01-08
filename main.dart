import 'package:flutter/material.dart';
import 'dart:async';
import 'screens/homescreen.dart';
import 'screens/login.dart';
import 'screens/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Set SplashScreen as the home screen
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Add a delay to simulate a splash screen
    Timer(Duration(seconds: 4), () {
      // Navigate to the main screen after the splash screen is displayed
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              'assets/splashlogo.png',
              width: 200.0, // Customize the image width
              height: 200.0, // Customize the image height
            ),

          ],
        ),
      ),
    );
  }
}

