import 'dart:async';

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
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController adtxt;
  late String character;
  late int index;

  @override
  void initState() {
    adtxt = TextEditingController();
    character = '';
    index = 1;

    //Timer 설치
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      changeTxt();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('LED 광고'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                character,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            // padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                // ignore: sort_child_properties_last
                child: Center(
                  child: Text(
                    '광고 문구를 입력하세요',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 240,
                height: 40,
                child: TextField(
                  controller: adtxt,
                  decoration: const InputDecoration(
                    labelText: " 문구를 입력해 주세요!",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.amber),
                    ),
                  ),
                  keyboardType: TextInputType.text, // Text
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    character='';
                    index=0;
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[200],
                  ),
                  child: const Text('광고문구 생성', 
                  style: TextStyle(
                    color: Colors.white
                  ),))
            ],
          ),
        ),
      ),
    );
  }

  //- function
  changeTxt() {
    String displayCharacter = adtxt.text;
    List str = [];
    str = displayCharacter.split('');

    // character = str[0];

    setState(() {
      if (index == str.length) {
        character = str[0];
        index = 1;
      } else {
        character += str[index];
        index++;
      }
    });
  }
} //end
