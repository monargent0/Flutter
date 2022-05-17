import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: const Color.fromARGB(255, 247, 217, 247),
       appBar: AppBar(
        title: const Text('Hero Zone'),
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/Lee.jpg'),
                  backgroundColor: Colors.orange,
                  radius: 100,
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
                  color: Colors.brown,
                  letterSpacing: 1,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 6),
                child: Text(
                  '이순신 장군',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.brown,
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
                  color: Colors.brown,
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
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/turtle.gif'),
                    backgroundColor: const Color.fromARGB(255, 247, 217, 247),
                    radius: 60,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.air_rounded,
                      size: 20,
                    ),
                    label: const Text('Go to Main'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey, minimumSize: const Size(200, 40)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

     );
  }
}