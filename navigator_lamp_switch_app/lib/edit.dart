import 'package:flutter/material.dart';

class EditView extends StatefulWidget {
  final bool switchColor;
  final bool switchLamp;
  const EditView({Key? key , required this.switchColor , required this.switchLamp}) : super(key: key);

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  late bool switchColor;
  late bool switchLamp;

  late String _colorStatus;
  late String _lampStatus;

  List status = [];

  @override
  void initState() {
    super.initState();
    if (widget.switchColor) {
      _colorStatus = 'Red';
      switchColor = true;
    } else {
      _colorStatus = 'Yellow';
      switchColor = false;
    }

    if (widget.switchLamp) {
     _lampStatus = 'On';
      switchLamp = true;
    } else {
      _lampStatus = 'Off';
      switchLamp = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정 화면'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 50, child: Text(_colorStatus)),
                Switch(
                  value: switchColor,
                  onChanged: (value) {
                    setState(() {
                      switchColor = value;
                      if (switchColor == true) {
                        _colorStatus = 'Red';
                      } else {
                        _colorStatus = 'Yellow';
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 50, child: Text(_lampStatus)),
                Switch(
                  value: switchLamp,
                  onChanged: (value) {
                    setState(() {
                      switchLamp = value;
                      if (switchLamp == true) {
                        _lampStatus = 'On';
                      } else {
                        _lampStatus = 'Off';
                      }
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  // String test = 'test'; // value 넘기기 테스트 용
                  status.add(switchColor); // [0]
                  status.add(switchLamp); // [1]
                  Navigator.pop(context , status); // test -> value 로 받는다. 하나밖에 못 받기 때문에 이때 List를 사용해서 여러 값을 보낼 수 있다.
                },
                child: const Text('OK'))
          ],
        ),
      ),
    );
  }



} // end
