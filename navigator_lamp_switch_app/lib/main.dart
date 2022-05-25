import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/edit.dart';

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

  late bool switchColor;
  late bool switchLamp;

  @override
  void initState() {
    super.initState();
    imgPath = 'images/lamp_on.png';
    switchColor = false;
    switchLamp = true;
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
                    return EditView(
                        switchColor: switchColor, switchLamp: switchLamp);
                  },
                )).then((value) => rebuildImg(value)); // 함수 형식
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
// context 사진 새로고침
  rebuildImg(value) {
    // print('Controller : $value'); // value 값 들어오는거 확인
    setState(() {
      if (value[1] == true) {
        if (value[0] == true) {
          imgPath = 'images/lamp_red.png';
          switchColor = true;
        } else {
          imgPath = 'images/lamp_on.png';
          switchColor = false;
        }
        switchLamp = true;
      } else {
        imgPath = 'images/lamp_off.png';
        switchLamp = false;
        if (value[0] == true) {
          switchColor = true;
        } else {
          switchColor = false;
        }
      }
    });
  } //

} // end
