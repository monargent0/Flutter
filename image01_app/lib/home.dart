import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red[200],
//       appBar: AppBar(
//         title: const Text('Images 01'),
//         backgroundColor: Colors.red,
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.horizontal, // 기본값은 vertical , horizontal로 가로 방향스크롤 설정 
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: CircleAvatar(
//                   backgroundColor: Colors.red,
//                   backgroundImage: AssetImage('images/pikachu-1.jpg'),
//                   radius: 50,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: CircleAvatar(
//                   backgroundColor: Colors.red,
//                   backgroundImage: AssetImage('images/pikachu-2.jpg'),
//                   radius: 50,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: CircleAvatar(
//                   backgroundColor: Colors.red,
//                   backgroundImage: AssetImage('images/pikachu-3.jpg'),
//                   radius: 50,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: CircleAvatar(
//                   backgroundColor: Colors.red,
//                   backgroundImage: AssetImage('images/pikachu-1.jpg'),
//                   radius: 50,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: CircleAvatar(
//                   backgroundColor: Colors.red,
//                   backgroundImage: AssetImage('images/pikachu-2.jpg'),
//                   radius: 50,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: CircleAvatar(
//                   backgroundColor: Colors.red,
//                   backgroundImage: AssetImage('images/pikachu-3.jpg'),
//                   radius: 50,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Image CircleAvatar 예제 (피카츄 삼각형 배치)
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title : const Text('Image Ex01'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.red,
              backgroundImage: AssetImage('images/pikachu-1.jpg'),
              radius: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: CircleAvatar(
                        backgroundColor: Colors.red,
                        backgroundImage: AssetImage('images/pikachu-2.jpg'),
                        radius: 50,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: CircleAvatar(
                        backgroundColor: Colors.red,
                        backgroundImage: AssetImage('images/pikachu-3.jpg'),
                        radius: 50,
                      ),
                ),
              ],
            ),

          ],
        ),
      ),

    );
  }
}