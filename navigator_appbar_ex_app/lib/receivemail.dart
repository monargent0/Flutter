import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReceiveMail extends StatelessWidget {
  const ReceiveMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        title: const Text('Receive Mail',),
        leading: IconButton(
          onPressed:(){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.home_filled)),
      ),
      body: Padding(
       padding: const EdgeInsets.all(10.0),
       child: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          Text('유비에게서 온 메일',),
          Text('관우에게서 온 메일',),
          Text('장비에게서 온 메일',),
          ],
        ),
      ),
    );
  }
}