import 'package:flutter/material.dart';
import 'package:snackbar_app/snackbar.dart';

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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack Bar'),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.blueGrey,
      ),
//---------------------- class 파일 이용 snackbar.dart
      // body: const MySnackBar(), // 사용법 3
//---------------------- 1
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //      //사용법 1 >
            // ScaffoldMessenger.of(context).showSnackBar(
            //   const SnackBar(
            //     content: Text('Elevated Button is clicked'),
            //     duration: Duration(seconds: 1),
            //     backgroundColor: Colors.redAccent,
            //     ),
            // );
      //     },
      //     child: const Text('Snackbar Button'),
      //   ),
      // ),
//---------------------- 2
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       snackBarFunction(context); // 사용법 2
      //     },
      //     child: const Text('Snackbar Button'),
      //   ),
      // ),
//---------------------- 파란버튼 빨간버튼 예제
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(
            onPressed: (){
              snackBarFunctionR(context); // 사용법 2
            }, 
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            child: const Text('RED Snackbar Button'),
            ),

            ElevatedButton(
            onPressed: (){
              snackBarFunctionB(context); // 사용법 2
            }, 
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
            ),
            child: const Text('BLUE Snackbar Button'),
            ),

          ],
          ), 
        ),
//----------------------


    );
  }

//----------------------
  // --- Functions
  // 사용법 2 > on pressed에 긴 코드는 쓰지 않는다 
  snackBarFunction(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Elevated Button is clicked'),
                duration: Duration(milliseconds: 200),
                backgroundColor: Colors.blueAccent,
                ),
            );
  }
//---------------------- 파란버튼 빨간버튼
  snackBarFunctionB(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Elevated Button is clicked'),
                duration: Duration(milliseconds: 200),
                backgroundColor: Colors.blueAccent,
                ),
            );
  }
  snackBarFunctionR(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Elevated Button is clicked'),
                duration: Duration(seconds: 1),
                backgroundColor: Colors.redAccent,
                ),
            );
  }
//----------------------
  
  // 사용법 3 > Class 만들어 사용 - snackbar.dart


} // End
