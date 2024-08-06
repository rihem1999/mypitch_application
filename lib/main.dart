import 'package:flutter/material.dart';
import 'package:mypitch_application/viewmodels/auth_viewmodel.dart';
import 'package:mypitch_application/viewmodels/game_viewmodel.dart';
import 'views/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => GameViewModel()),
      ],
      child: MaterialApp(
      title: 'MyPatch',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 174, 190, 202),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ),);
  }
}
