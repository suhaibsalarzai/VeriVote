import 'package:flutter/material.dart';
import 'package:myapp/splashScreen.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/login-1-.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
          )),
      home: const SplashScreen(),
    );
  }
}
