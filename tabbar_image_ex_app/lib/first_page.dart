import 'package:flutter/material.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // property
  late List imageName;
  late int currentImage; // 현재 이미지
  late List imgTitle;
  late Color bdCol;

  @override
  void initState() {
    imageName = [
      'bori1.jpeg',
      'bori2.jpeg',
      'bori3.jpeg',
      'bori4.jpeg',
      'bori5.jpeg',
      'bori6.jpeg',
      'bori7.jpeg',
    ];
    currentImage = 0;
    imgTitle = [
      '꿀잠 자는 보리',
      '우아한 보리',
      '짱 귀여운 보리',
      '뒷통수 보리',
      '사랑스러운 보리',
      '불 좀 꺼줘 보리',
      '독백 보리',
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      // appBar: AppBar(
      //   title: const Text('Image Swiping'),
      //   backgroundColor: Colors.purple[300],
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   imageName[currentImage],
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                imgTitle[currentImage],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.purple,
                        width: 5,
                      )),
                  child: Image.asset(
                    'images/${imageName[currentImage]}',
                    width: 320,
                    height: 450,
                    fit: BoxFit.fitHeight,
                  ),
                ),
               
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      prevBt();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink[100],
                    ),
                    child: const Text(
                      '<< 이전',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      nextBt();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pink[100],
                    ),
                    child: const Text(
                      '다음 >>',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//--function

  prevBt() {
    setState(() {
      currentImage -= 1;
      // bdCol = ;
      if (currentImage < 0) {
        currentImage = imageName.length - 1;
      }
    });
  }

  nextBt() {
    setState(() {
      currentImage += 1;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
    });
  }
} // end
