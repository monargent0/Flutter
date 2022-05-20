import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String character;
  late int index;

  @override
  void initState() {
    character = '';
    index = 1;

    //Timer 설치
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      changeTxt();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LED 광고'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(character , 
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),
            ),
            Text('$index', )
          ],
        ),
      ),
    );
  }

//- function
  changeTxt() {
    String displayCharacter = '대한민국';
    List str = [];
    str = displayCharacter.split('');
   
    // character = str[0];

    setState(() {
      if(index == str.length){
        character = str[0];
        index = 1;
      }else{
      character += str[index];
      index ++;

      }
    });
  }
} // end
