import 'package:bmi_calc_app/home.dart';
import 'package:bmi_calc_app/input.dart';
import 'package:bmi_calc_app/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context) => const Home(),
        '/input' :(context) => const Input(),
        '/result' :(context) => const Result(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
