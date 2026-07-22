
import 'dart:async';
import 'package:flutter/material.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [

            Text(
              "🏪",
              style: TextStyle(fontSize: 60),
            ),

            SizedBox(height: 20),

            Text(
              "SAIRA SUPERMARKET",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Powered by\nSaira Business System",
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 30),

            CircularProgressIndicator(),

            SizedBox(height: 20),

            Text("Version 1.0"),
          ],
        ),
      ),
    );
  }
}
