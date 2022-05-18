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
  // property 전역변수
  late bool switchValue;

  @override // 초기값
  void initState() {
    switchValue = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch')),
      body: Center(
        child: Switch(
          value: switchValue, // 화면에 보여지는 value
          onChanged: (value) { // 사용자가 움직이는 값. 변수 이름은 value가 아니어도 된다.
            setState(() {
              switchValue = value;
            });
          },
        ),
      ),
    );
  }
}
