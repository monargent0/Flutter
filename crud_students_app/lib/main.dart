import 'package:crud_students_app/home.dart';
import 'package:crud_students_app/insert.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        '/': (context) => const AllList(),
        '/insert' :(context) => const InsertS(),
        // '/update' :(context) => const UpdateS(),
        // '/delete' :(context) => const DeleteS(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
