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
        primarySwatch: Colors.lime,
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
  //Property
  late String _lampImage; // Image file
  late double _lampWidth; // Image Width
  late double _lampHeight; // Image Height
  late bool _lampSwitch; // swith status
  late bool _zoomSwitch; // swith status
  late bool _colorSwitch; // swith status

  @override
  void initState() {
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _lampSwitch = true;
    _zoomSwitch = false;
    _colorSwitch = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Image Zoom In & Out'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 650,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    // child에 높이 너비 권한까지 넘어왔기 때문에 확대 축소가 먹지 않는다
                    _lampImage,
                    width: _lampWidth,
                    height: _lampHeight,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text('전구 확대'),
                    Switch(
                        value: _zoomSwitch,
                        onChanged: (value) {
                          setState(() {
                            _zoomSwitch = value;
                            decisionLampSize();
                          });
                        }),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const Text(
                      '전구 스위치',
                    ),
                    Switch(
                        value: _lampSwitch,
                        onChanged: (value) {
                          setState(() {
                            _lampSwitch = value;
                            decisionOnOff();
                          });
                        })
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const Text('전구 색칠'),
                    Switch(
                        value: _colorSwitch,
                        onChanged: (value) {
                          setState(() {
                            _colorSwitch = value;
                            decisionColor();
                          });
                        }),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // -- Function
// 램프 켜고 끄기
  decisionOnOff() {
    if (_lampSwitch == true) {
      if (_colorSwitch == true) {
        _lampImage = 'images/lamp_red.png';
      } else {
        _lampImage = 'images/lamp_on.png';
      }
    } else {
      _lampImage = 'images/lamp_off.png';
    }
  }

// 램프 사이즈 확대 축소
  decisionLampSize() {
    if (_zoomSwitch == true) {
      _lampHeight = 600;
      _lampWidth = 300;
    } else {
      _lampHeight = 300;
      _lampWidth = 150;
    }
  }

// 램프 색칠
  decisionColor() {
    if (_lampSwitch == true) {
      if (_colorSwitch == true) {
        _lampImage = 'images/lamp_red.png';
      } else {
        _lampImage = 'images/lamp_on.png';
      }
    } else {
      _lampImage = 'images/lamp_off.png';
    }
  }
} // 
