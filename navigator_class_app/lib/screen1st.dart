import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Screen1st extends StatelessWidget {
  const Screen1st({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Screen 1st'),
        ),
      body: const Center(
        child: Text(
          'Screen 1st',
          style: TextStyle(fontSize: 28, ),
        )
      ),

    );
  }
}