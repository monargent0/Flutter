import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Screen2nd extends StatelessWidget {
  const Screen2nd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Screen 2nd'),
        ),
      body: const Center(
        child: Text(
          'Screen 2nd',
          style: TextStyle(fontSize: 28, ),
        )
      ),

    );
  }
}