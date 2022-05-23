import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Text('두번쨰 페이지'),
      ),

   );
  }
}