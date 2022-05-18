import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alert and push',
          ),
        ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: const Text(
            'Move the 2nd page.',
            ),
        ),
        ),
    );
  }
  // --- Function
  _showDialog(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (BuildContext ctx){
        return AlertDialog(
          title: const Center(child: Text('Page 이동')),
          content: const Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
          actions: [
            TextButton(
              onPressed: (){
                //Navigator.of(ctx).pop(); // 순서 중요
                //Navigator.pushNamed(context, '/next'); // 순서 중요

                Navigator.popAndPushNamed(context, '/next');
              }, 
              style: TextButton.styleFrom( primary: Colors.deepPurple , backgroundColor: Colors.purple[100]),
              child: const Text('Page 이동'),
              ),
          ],
        );
      }
    );
  }
} // end