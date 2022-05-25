import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/Vol1/edit.dart';
import 'package:navigator_lamp_switch_app/Vol1/warehouse.dart';

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
        primarySwatch: Colors.blueGrey,
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
  late String imgPath;
  @override
  void initState() {
    super.initState();
    imgPath = 'images/lamp_on.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const EditView();
                  },
                )).then((value) => rebuildImg()); // 함수 형식
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imgPath,
              width: 200,
              height: 400,
            ),
          ],
        ),
      ),
    );
  }

// ---Fun.
// 사진 새로고침
  rebuildImg() {
    setState(() {
      imgPath = WareHouse.imagePath;
    });
  } //

// ---- Function
// then 뒤에 함수를 이렇게 써도 될듯
// 변경 스위치
  // editLamp() {
  //   if (WareHouse.lampOnOff == true) {
  //     if (WareHouse.colorOnOff == true) {
  //       imgPath = 'images/lamp_red.png';
  //     } else {
  //       imgPath = 'images/lamp_on.png';
  //     }
  //   } else {
  //     imgPath = 'images/lamp_off.png';
  //   }
  // }

} // end
