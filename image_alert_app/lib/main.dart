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
  late String _lampSatus; // Lamp Onoff 상태

  @override
  void initState() {
    _lampImage = 'images/lamp_on.png';
    _lampSatus = 'on';
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
              width: 300,
              height: 400,
              child: Column(
                children: [
                  Image.asset(
                    _lampImage,
                    width: 200,
                    height: 400,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _onButton(context),
                  child: const Text('켜기'),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () => _offButton(context),
                  child: const Text('끄기'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

// setSate는 필요한 부분에만 쓰는게 퍼포먼스가 좋다. 
// function밖에서 set을 해줘도 적용은 되지만 굳이 setsate하지 않아도 될것을 새로고침하기 때문에 퍼포먼스가 구림

// --- Function
// on Button
  _onButton(BuildContext context) {
    if (_lampSatus == 'on') {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('경고'),
              content: const Text('현재 램프가 켜진 상태 입니다.'),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(); // 순서 중요
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.deepPurple,
                    ),
                    child: const Text('네, 알겠습니다.'),
                  ),
                ),
              ],
            );
          }); // showDialog
    } else if (_lampSatus == 'off') {
      setState(() {
        _lampSatus = 'on';
        _lampImage = 'images/lamp_on.png';
      });
    }
  } // 켜기 버튼

// off Button
  _offButton(BuildContext context) {
    if (_lampSatus == 'on') {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('램프 끄기'),
              content: const Text('램프를 끄시겠습니까?'),
              actions: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(); // 순서 중요
                          setState(() {
                            _lampSatus = 'off';
                            _lampImage = 'images/lamp_off.png';
                          });
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.deepPurple,
                        ),
                        child: const Text('네'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(); // 순서 중요
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.deepPurple,
                        ),
                        child: const Text('아니요'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }); // showDialog
    } else if (_lampSatus == 'off') {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('경고'),
              content: const Text('현재 램프가 꺼진 상태 입니다.'),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(); // 순서 중요
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.deepPurple,
                    ),
                    child: const Text('네, 알겠습니다.'),
                  ),
                ),
              ],
            );
          }); // showDialog
    }
  }
}
