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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: const Text(
            'Hello World!',
          ),
        ),
      ),
    );
  } 
  // functions
  _showDialog(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false, // user must tap button 버튼을 눌러야만 알림창 종료
      builder: (BuildContext ctx){
        return AlertDialog(
          title: const Text('Alert Title'),
          content: const Text('Hello World를 Touch\n했습니다.'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(ctx).pop(); // context가 두개라서 ctx를 지정해서 종료 
              }, 
              child: const Text('종료'),
              ),
          ],
        );
      }

    );
  }




} // End
