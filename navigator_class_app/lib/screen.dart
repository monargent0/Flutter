import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Main Screen',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/1st');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text(
                'Go to the Screen #1',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/2nd');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink),
              ),
              child: const Text(
                'Go to the Screen #2',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
