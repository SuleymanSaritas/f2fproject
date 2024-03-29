import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/home/home_screen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        hintColor: Colors.white,
        focusColor: Colors.white,
        shadowColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        primaryColor: Colors.deepPurple,
        fontFamily: 'Lato',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        hintColor: Colors.black,
        focusColor: Colors.black,
        shadowColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.white,
        primaryColor: Colors.deepPurple,
        fontFamily: 'Lato',
      ),
      themeMode: ThemeMode.system,
      home: NavigationPage(),
    );
  }
}
