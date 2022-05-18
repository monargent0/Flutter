import 'package:alert_dialog_ex_app/firstpage.dart';
import 'package:alert_dialog_ex_app/secondpage.dart';
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
         '/' : (context) => const FirstPage(),
        '/next' : (context) => const SecondPage(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}

