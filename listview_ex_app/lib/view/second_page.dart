import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_ex_app/model/flag.dart';

class SecondPage extends StatefulWidget {
  final List<Flag> list;
  const SecondPage({Key? key, required this.list}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  //property
  final controller = TextEditingController();
  var newimagePath;
  String imageNation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: const InputDecoration(labelText: '국가를 입력하세요.'),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      newimagePath = 'images/korea.png';
                      setState(() {
                        imageNation = '> 대한민국 <';
                      });
                    },
                    child: Image.asset(
                      'images/korea.png',
                      width: 90,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      newimagePath = 'images/spain.png';
                      setState(() {
                        imageNation = '> 스페인 <';
                      });
                    },
                    child: Image.asset(
                      'images/spain.png',
                      width: 90,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      newimagePath = 'images/chile.png';
                      setState(() {
                        imageNation = '> 칠레 <';
                      });
                    },
                    child: Image.asset(
                      'images/chile.png',
                      width: 90,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      newimagePath = 'images/china.png';
                      setState(() {
                        imageNation = '> 중국 <';
                      });
                    },
                    child: Image.asset(
                      'images/china.png',
                      width: 90,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      newimagePath = 'images/austria.png';
                      setState(() {
                        imageNation = '> 오스트리아 <';
                      });
                    },
                    child: Image.asset(
                      'images/austria.png',
                      width: 90,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      newimagePath = 'images/belgium.png';
                      setState(() {
                        imageNation = '> 벨기에 <';
                      });
                    },
                    child: Image.asset(
                      'images/belgium.png',
                      width: 90,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      newimagePath = 'images/estonia.png';
                      setState(() {
                        imageNation = '> 에스토니아 <';
                      });
                    },
                    child: Image.asset(
                      'images/estonia.png',
                      width: 90,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                imageNation,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var flag =
                    Flag(imagePath: newimagePath, nation: controller.text);
                showInfo(context, flag);
              },
              child: const Text(
                '문제 추가하기',
              ),
            ),
          ],
        ),
      ),
    );
  }

  //---function
// 입력정보 알림창
  showInfo(BuildContext context, Flag flag) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('문제 추가하기'),
            content: Text(
              '이 국기의 문제는 ${flag.nation.substring(0, 1)}'
              '${"_" * (flag.nation.length - 1)}입니다.\n'
              '문제의 정답은 ${flag.nation}입니다.\n'
              '이 문제를 추가 하시겠습니까?',
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    widget.list.add(flag);
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('예')),
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text(
                    '아니요',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )),
            ],
          );
        });
  }
}//end