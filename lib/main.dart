import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_07/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xff0b0e21),
        // ignore: deprecated_member_use
        accentColor: Colors.blueGrey,
        textTheme: const TextTheme(
          headline4: TextStyle(color: Colors.white, fontSize: 102.0),
        ),
        scaffoldBackgroundColor: const Color(0xff0b0e21),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
