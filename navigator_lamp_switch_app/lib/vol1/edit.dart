import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/Vol1/warehouse.dart';

class EditView extends StatefulWidget {
  const EditView({Key? key}) : super(key: key);

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  late bool switchColor;
  late bool switchLamp;

  late String _colorStatus;
  late String _lampStatus;

  @override
  void initState() {
    super.initState();
    if (WareHouse.colorOnOff) {
      _colorStatus = 'Red';
      switchColor = true;
    } else {
      _colorStatus = 'Yellow';
      switchColor = false;
    }

    if (WareHouse.lampOnOff) {
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
                  WareHouse.colorOnOff = switchColor;
                  WareHouse.lampOnOff = switchLamp;
                  
                  editLamp();
                  Navigator.pop(context);
                },
                child: const Text('OK'))
          ],
        ),
      ),
    );
  }

// ---- Function
// 변경 스위치
  editLamp() {
    if (switchLamp == true) {
      if (switchColor == true) {
        WareHouse.imagePath = 'images/lamp_red.png';
      } else {
        WareHouse.imagePath = 'images/lamp_on.png';
      }
    } else {
      WareHouse.imagePath = 'images/lamp_off.png';
    }
  } //edit

} // end
