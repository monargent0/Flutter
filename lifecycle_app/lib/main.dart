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

// stf로 작성
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Property (바뀌는 변수)
  late String _buttonState;
  late String _buttonTxt;
  late var _btcolor;
  late Color _buttonColor;

  @override
  void initState() {
    _buttonState = 'OFF';
    _buttonTxt = '버튼을 누르세요!';
    _btcolor = 0xffFFFFFF; // 혼자 해본거 Hex 코드 사용
    _buttonColor = Colors.red;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Life Cycle',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _onClick();
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(150, 40),
              // primary: Color(_btcolor) 
              primary: _buttonColor, 
              ) ,
              child: Text(_buttonTxt),
            ),
            const SizedBox(
              height: 50,
            ),
            Text('버튼 상태 : $_buttonState'),
          ],
        ),
      ),
    );
  }

//--- Function
  _onClick() {
    setState(() {
      // 빌드에게 화면을 바꾸라고 신호를 줘야 한다
      if (_buttonState == 'OFF') {
        _buttonState = 'ON';
        _buttonTxt = 'Press Button';
        // _btcolor = 0XFF03B1FC;
        _buttonColor = Colors.amber;
      } else {
        _buttonState = 'OFF';
        _buttonTxt = '버튼을 누르세요!';
        // _btcolor = 0xffFFFFFF;
        _buttonColor = Colors.red;
      }
    });
  }
} // End
