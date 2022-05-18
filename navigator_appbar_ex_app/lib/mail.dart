import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mail extends StatelessWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text('Navigator_AppBar',),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/send');
            }, 
            icon: const Icon(Icons.email_rounded)),
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, '/receive');
            }, 
            icon: const Icon(Icons.email_outlined)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/send');
              }, 
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.lightGreen)),
              child: const Text('보낸 편지함',),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/receive');
              }, 
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pink)),
              child: const Text('받은 편지함',),
            ),

          ],
        ),
      ),
    );
  }
}