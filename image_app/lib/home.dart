import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// 스마일 사진 어플
// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amberAccent,
//       appBar: AppBar(
//         title: const Text('Image Test'),
//       ),
//       body: Center(
//         child: Image.asset(
//           'images/smile.png',
//           width: 200,
//           height: 200,
//         ),
//       ),
//     );
//   }
// }

// 피카츄 사진 어플
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Image Padding'),
      ),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
              'images/pikachu-1.jpg',
              width: 120,
              height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
              'images/pikachu-2.jpg',
              width: 120,
              height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
              'images/pikachu-3.jpg',
              width: 120,
              height: 120,
              ),
            ),
          ]
        ),
      ),
    );
  }
}