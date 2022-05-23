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
        primarySwatch: Colors.deepOrange,
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
  late String _lampImage; // Image Name
  late double _lampWidth; // Image Width
  late double _lampHeight; // Image Height
  late String _buttonName; // button Txt
  late bool _switch; // swith status
  late String _lampSizeStatus; // Image Size Status

  @override
  void initState() {
    // 앱 실행할때 한번만 실행된다
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = 'Image 확대';
    _switch = true;
    _lampSizeStatus = 'small';

    super.initState();
  }

//---- 이 위는 앱 실행 할때만 한번 사용되고 다시 사용되지 않는다

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
                    Image.asset( // child에 높이 너비 권한까지 넘어왔기 때문에 확대 축소가 먹지 않는다
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
                  TextButton(
                    onPressed: () {
                      setState(() {
                        decisionLampSize();
                      });
                    },
                    child: Text(_buttonName),
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
                          value: _switch,
                          onChanged: (value) {
                            setState(() {
                              _switch = value;
                              decisionOnOff();
                            });
                          })
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        );
  }

//- Function
// 램프 켜고 끄기
  decisionOnOff() {
    if (_switch == true) {
      _lampImage = 'images/lamp_on.png';
    } else {
      _lampImage = 'images/lamp_off.png';
    }
  }

// 램프 사이즈 확대 축소
  decisionLampSize() {
    if (_lampSizeStatus == 'small') {
      _lampHeight = 600;
      _lampWidth = 300;
      _buttonName = 'Image 축소';
      _lampSizeStatus = 'large';
    } else {
      _lampHeight = 300;
      _lampWidth = 150;
      _buttonName = 'Image 확대';
      _lampSizeStatus = 'small';
    }
  }
}//end
