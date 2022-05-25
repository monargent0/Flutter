import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// id root / pw qwer1234
class _HomeState extends State<Home> {
  // p
  final idcontroller = TextEditingController();
  final pwcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log In',
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              width: 200,
              height: 200,
              child: Icon(
                Icons.account_circle_rounded,
                size: 160,
                color: Colors.teal,
              ),
            ),
            TextField(
              controller: idcontroller,
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: const InputDecoration(labelText: '사용자 아이디를 입력하세요.'),
            ),
            TextField(
              controller: pwcontroller,
              keyboardType: TextInputType.text,
              maxLines: 1,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: '패스워드를 입력하세요.',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (idcontroller.text.trim().isEmpty ||
                      pwcontroller.text.trim().isEmpty) {
                    emptySnackBar();
                  } else if (idcontroller.text == 'root' &&
                      pwcontroller.text == 'qwer1234') {
                    alertLogin(context);
                  } else {
                    errorSnackBar();
                  }
                },
                child: const Text('Log In')),
          ],
        ),
      ),
    );
  }

//----Function
// 입력 공백
  emptySnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('사용자 아이디와 암호를 입력하세요!'),
      duration: Duration(
        seconds: 2,
      ),
      backgroundColor: Colors.redAccent,
    ));
  }

// 입력 에러
  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('입력 정보를 확인해 주세요!'),
      duration: Duration(
        seconds: 2,
      ),
      backgroundColor: Colors.redAccent,
    ));
  }

// 로그인 성공 알림창
  alertLogin(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('환영 합니다!'),
            content: const Text('신분이 확인 되었습니다.'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/homepage');
                    idcontroller.text='';
                    pwcontroller.text='';
                  },
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.amber[100]),
                  child: const Text('OK'))
            ],
          );
        });
  }
}// end