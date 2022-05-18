import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/mail.dart';
import 'package:navigator_appbar_ex_app/receivemail.dart';
import 'package:navigator_appbar_ex_app/sendmail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context) => const Mail(),
        '/send' : (context) => const SendMail(),
        '/receive' : (context) => const ReceiveMail(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
