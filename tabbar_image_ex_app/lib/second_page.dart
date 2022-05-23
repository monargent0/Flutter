import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
      // backgroundColor: Colors.grey[200],
      // appBar: AppBar(
      //   title: const Text('Image Swiping'),
      //   backgroundColor: Colors.purple[300],
      // ),
      body: SimpleGestureDetector(
        onVerticalSwipe: _onVerticalSwipe,
        onHorizontalSwipe: _onHorizontalSwipe,
        child: Center(
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
                          color: Colors.deepPurple,
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

} // end
