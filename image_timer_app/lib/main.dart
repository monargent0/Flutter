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
        primarySwatch: Colors.blue,
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
  // property
  late List imageName;
  late int currentImage; // 현재 이미지
  late List imgTitle;

  @override
  void initState() {
    imageName = [
      'bori1.jpeg',
      'bori2.jpeg',
      'bori3.jpeg',
      'bori4.jpeg',
      'bori5.jpeg',
      'bori6.jpeg',
      'bori7.jpeg',
    ];
    currentImage = 0;

    imgTitle = [
      '꿀잠 자는 보리',
      '우아한 보리',
      '짱 귀여운 보리',
      '뒷통수 보리',
      '사랑스러운 보리',
      '불 좀 꺼줘 보리',
      '독백 보리',
    ];

    //Timer 설치
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      changeImage();
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3초 간격으로 이미지가 바뀜'),
        backgroundColor: Colors.purple[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageName[currentImage],
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'images/${imageName[currentImage]}',
              width: 300,
              height: 450,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    );
  }

//function
  changeImage() {
    setState(() {
      currentImage++;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
    });
  }
} //
