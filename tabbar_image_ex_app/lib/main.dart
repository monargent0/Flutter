import 'package:flutter/material.dart';
import 'package:tabbar_image_ex_app/first_page.dart';
import 'package:tabbar_image_ex_app/second_page.dart';

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
        primarySwatch: Colors.pink,
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

// with SingleTickerProviderStateMixin ; 탭바 만들어 주는 애 상속받기
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // property
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    // length 내가 쓸 탭 개수, sync ; 메인에서 관리한다
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  } // 앱이 종료 될때 정리된다 / init으로 시작 dispose로 정리

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Tab Bar Exam.'),
      ),
      body: TabBarView(
        controller: controller,
        children: const [FirstPage(), SecondPage()],
      ),
      bottomNavigationBar: Container(
        color: Colors.red[100],
        height: 100,
        child: TabBar(
          controller: controller,
          labelColor: Colors.redAccent,
          indicatorColor: Colors.blueAccent,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.ac_unit_rounded,
                color: Colors.black54,
              ),
              text: "Button",
            ),
            Tab(
              icon: Icon(
                Icons.announcement_rounded,
                color: Colors.black54,
              ),
              text: 'Swipe',
            ),
          ],
        ),
      ),
    );
  }
}
