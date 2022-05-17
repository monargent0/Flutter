import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator_app/Pages/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    )); // => 한줄짜리 함수
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return const SecondPage();
                //   },
                // )); // 함수 형식
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amberAccent,
              ),
              child: const Text('Go to the second page'))),
    );
  }
}
