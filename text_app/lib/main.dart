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
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false, // 디버그 표시 True / false 로 없애기
    );
  }
}
// home : MyHomePage() 와 아래 위젯 이름을 동일하게 맞춰줘야 한다
// typing : stl
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
// Scaffold : 화면 디자인 담당
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text(
          // const : JAVA의 final. 한번 표시하면 바뀌지 않는다, 랜더링 하지 않을 것이다 (고정값)
          '대한민국', // "" '' 아무거나 사용 가능하다
        ),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ), // 앱바가 있으면 AOS 스타일, 없으면 IOS 스타일
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center , // column은 y 방향이 주축 방향 
          children: const [
            Text(
              '유비',
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '관우',
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '장비',
            ),
          ], // wrap Column
        ),
      ),
    );
  }
}
