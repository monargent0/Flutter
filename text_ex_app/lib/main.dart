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
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Text Exercise 01'
        ),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Divider(
              height: 20, // 뭔지 모를떄 돋보기로 영역을 확인해본다 
              color: Colors.red,
              thickness: 1, // 줄의 두께
            ),
            Text(
              '유비',
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 28,
                fontWeight: FontWeight.bold, 
                letterSpacing: 5,
              ),
            ),
            Text(
              '관우'
            ),
            Text(
              '장비'
            ),
            Divider(
              height: 20, // 뭔지 모를떄 돋보기로 영역을 확인해본다 
              color: Colors.red,
              thickness: 1, // 줄의 두께
            ),
            Text(
              '조조'
            ),
            Text(
              '여포'
            ),
            Text(
              '동탁'
            ),
            Divider(
              height: 20, // 뭔지 모를떄 돋보기로 영역을 확인해본다 
              color: Colors.red,
              thickness: 1, // 줄의 두께
            ),
          ],
        ),
      ),
    );

  }
}