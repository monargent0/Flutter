import 'package:flutter/material.dart';
import 'package:navigator_class_app/screen.dart';
import 'package:navigator_class_app/screen1st.dart';
import 'package:navigator_class_app/screen2nd.dart';

void main() {
  runApp(const MyApp());
}

// 화면이 여러개인 어플 : main에 라우트 정보를 주는 방법
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 화면에 대한 라우팅 정보가 있어야 한다.
      routes: { // Map형식
        '/' : (context) => const Screen(),
        '/1st' : (context) => const Screen1st(),
        '/2nd' : (context) {
          return const Screen2nd();
        } 
      },
      initialRoute: '/', // 첫 시작 화면 설정, 반드시 있어야 한다.
      debugShowCheckedModeBanner: false,
    );
  }
}

