import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travel/sharedprefrencelibrary.dart';
import 'dart:async';
import 'screens/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  log("FCMToken $fcmToken");
  // Retrieve the FCM token from SharedPreferences
  await SharedPreferencesHelper.saveFcmToken(fcmToken);
  String? savedFcmToken = await SharedPreferencesHelper.getFcmToken();
  print("Saved FCM Token: $savedFcmToken");

  bool isLoggedIn = await SharedPreferencesHelper.getLoginStatus();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Set SplashScreen as the home screen
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Add a delay to simulate a splash screen
    Timer(const Duration(seconds: 4), () {
      // Navigate to the main screen after the splash screen is displayed
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
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


