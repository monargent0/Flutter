import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // property
  late List imageName;
  late int currentImage; // 현재 이미지
  late List imgTitle;
  late Color bdCol;

  @override
  void initState() {
    imageName = [
      // 'flower_01.png', // 0번
      // 'flower_02.png',
      // 'flower_03.png',
      // 'flower_04.png',
      // 'flower_05.png',
      // 'flower_06.png',
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
    bdCol = Colors.purple;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Image Swiping'),
        backgroundColor: Colors.purple[300],
      ),
      body: SimpleGestureDetector(
        onVerticalSwipe: _onVerticalSwipe,
        onHorizontalSwipe: _onHorizontalSwipe,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentImage],
              ),
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
                  TextButton.icon(
                      onPressed: () => prevBt(),
                      style:
                          TextButton.styleFrom(minimumSize: const Size(10, 40)),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          size: 30),
                      label: const Text('')),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: bdCol,
                              width: 10,
                            )),
                        child: Image.asset(
                          'images/${imageName[currentImage]}',
                          width: 280,
                          height: 450,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Positioned( // container 영역 안에만 보임 
                        right: 0,
                        //top: 10,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.pinkAccent,
                                width: 5,
                              )),
                          child: Image.asset(
                            'images/${imageName[currentImage < imageName.length - 1 ? currentImage + 1 : 0]}',
                            width: 100,
                            height: 100,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      )
                    ],
                  ),
                  TextButton.icon(
                      onPressed: () => nextBt(),
                      style:
                          TextButton.styleFrom(minimumSize: const Size(10, 40)),
                      icon:
                          const Icon(Icons.arrow_forward_ios_rounded, size: 30),
                      label: const Text('')),
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
      ),
    );
  }

//--function
// 이미지 스와이프 함수
  _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        currentImage += 1;
        if (currentImage >= imageName.length) {
          currentImage = 0; // List보다 길어지지 않도록 초기화
        }
      } else if (direction == SwipeDirection.right) {
        currentImage -= 1;
        if (currentImage < 0) {
          currentImage = imageName.length - 1; // -1 에러 없도록 초기화 인덱스 값이므로 -1 해주기
        }
      }
    });
  }

  _onVerticalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.down) {
        currentImage += 1;
        if (currentImage >= imageName.length) {
          currentImage = 0; // List보다 길어지지 않도록 초기화
        }
      } else if (direction == SwipeDirection.up) {
        currentImage -= 1;
        if (currentImage < 0) {
          currentImage = imageName.length - 1; // -1 에러 없도록 초기화 인덱스 값이므로 -1 해주기
        }
      }
    });
  }

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
