import 'package:flutter/material.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPatch',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 174, 190, 202),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
