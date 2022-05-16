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
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Text Row',
        ),
        backgroundColor: Colors.black38,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0), // row에 상하좌우 8 px씩 띄워준다 
              // 간격띄우는건 padding으로 많이 쓴다
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'James',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cathy',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Kenny',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'James',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cathy',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Kenny',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
