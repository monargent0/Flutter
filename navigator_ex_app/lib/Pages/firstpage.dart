import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: const Color.fromARGB(255, 247, 217, 247),
       appBar: AppBar(
        title: const Text('Bori Zone'),
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
            children: [
              Image.asset(
                'images/bori2.jpeg',
                width: 400,
                height: 400,
              ),
              Image.asset(
                'images/bori1.jpeg',
                width: 400,
                height: 400,
              ),
              Image.asset(
                'images/bori3.jpeg',
                width: 400,
                height: 500,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 247, 104, 152),
                ),
                label: const Text(
                  'Go to Main',
                ),
                style: OutlinedButton.styleFrom(
                  primary: const Color.fromARGB(255, 250, 61, 124),
                  backgroundColor: Colors.white,
                  minimumSize: const Size(200, 40)
                ),
            ),
              ),
      
            ],
          ),
          ),
        ),
      ),

     );
  }
}