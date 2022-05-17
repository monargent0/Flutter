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
        primarySwatch: Colors.red,
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
        title: const Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print(
                    'Text Button'); // dart언어 부분 ,print 하면 console에 출력 어플 출시 할땐 print있으면 안됨
              },
              onLongPress: () {
                print('Long pressed text button');
              },
              style: TextButton.styleFrom(
                primary: Colors.amber,
              ),
              child: const Text(
                'Text Button',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // --
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                'Elevated button',
              ),
            ),
            OutlinedButton(
              onPressed: () {
                // --
              },
              style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  )),
              child: const Text(
                'outlined button',
              ),
            ),
            TextButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
              label: const Text(
                'Go to home',
              ),
              style: TextButton.styleFrom(primary: Colors.purpleAccent),
            ),
            ElevatedButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.home,
                size: 20,
              ),
              label: const Text('Go to home'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, minimumSize: const Size(200, 40)),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                color: Colors.blueGrey,
              ),
              label: const Text(
                'Go to home',
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.black87,
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 247, 104, 152),
              ),
              label: const Text(
                'Go to home',
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.pink[200],
                backgroundColor: const Color.fromRGBO(246, 223, 231, 1),
              ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
            TextButton(
              onPressed: (){
                //
              },
              style: TextButton.styleFrom(
                primary: Colors.lightBlue,
                minimumSize: const Size(150, 40),
              ), 
              child: const Text('TextButton'),
              ),
            ElevatedButton(
              onPressed: (){
                //
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent,
                minimumSize: const Size(150, 40)
              ), 
              child: const Text('ElevaterButton',),
              )

           ],
           ),





          ],
        ),
      ),
    );
  }
}
