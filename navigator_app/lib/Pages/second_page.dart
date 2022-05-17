import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.cyan
        ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context); // 위에 쌓이는 것은 pop 으로 없앤다 
          }, 
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
          ),
          child: const Text('Go to the first page'),),
      ),

    );
  }
}