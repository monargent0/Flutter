import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('영웅 Card'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/Lee.jpg'),
                backgroundColor: Colors.orange,
                radius: 60,
              ),
            ),
            const Divider(
              height: 30, // 뭔지 모를떄 돋보기로 영역을 확인해본다
              endIndent: 0,
              indent: 0,
              color: Colors.brown,
              thickness: 1,
            ),
            const Text(
              '성웅',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 6),
              child: Text(
                '이순신 장군',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            const Text(
              '전적',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 10),
              child: Text(
                '62전 62승',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline_rounded),
                Text(
                  ' 옥포해전',
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline_rounded),
                Text(
                  ' 사천포해전',
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline_rounded),
                Text(
                  ' 당포해전',
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline_rounded),
                Text(
                  ' 한산도대첩',
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline_rounded),
                Text(
                  ' 부산포해전',
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline_rounded),
                Text(
                  ' 명량해전',
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.check_circle_outline_rounded),
                Text(
                  ' 노량해전',
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/turtle.gif'),
                backgroundColor: Colors.orange,
                radius: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
