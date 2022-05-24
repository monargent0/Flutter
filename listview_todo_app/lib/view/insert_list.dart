import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_todo_app/model/todo_list.dart';
import 'package:listview_todo_app/model/warehouse.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  // property
  late TextEditingController textEditingController;
  late bool cartSwitch;
  late bool clockSwitch;
  late bool pencilSwitch;
  late String imgPath;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    cartSwitch = true;
    clockSwitch = false;
    pencilSwitch = false;
    imgPath = 'images/cart.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Add View'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                    value: cartSwitch,
                    activeColor: Colors.amber,
                    onChanged: (value) {
                      setState(() {
                        cartSwitch = value;
                        if (cartSwitch == true) {
                          clockSwitch = false;
                          pencilSwitch = false;
                          imgPath = 'images/cart.png';
                        } else {
                          cartSwitch = true;
                        }
                      });
                    }),
                Image.asset(
                  'images/cart.png',
                  width: 40,
                  height: 40,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                    value: clockSwitch,
                    activeColor: Colors.amber,
                    onChanged: (value) {
                      setState(() {
                        clockSwitch = value;
                        if (clockSwitch == true) {
                          cartSwitch = false;
                          pencilSwitch = false;
                          imgPath = 'images/clock.png';
                        } else {
                          cartSwitch = true;
                          imgPath = 'images/cart.png';
                        }
                      });
                    }),
                Image.asset(
                  'images/clock.png',
                  width: 40,
                  height: 40,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                    value: pencilSwitch,
                    activeColor: Colors.amber,
                    onChanged: (value) {
                      setState(() {
                        pencilSwitch = value;
                        if (pencilSwitch == true) {
                          cartSwitch = false;
                          clockSwitch = false;
                          imgPath = 'images/pencil.png';
                        } else {
                          cartSwitch = true;
                          imgPath = 'images/cart.png';
                        }
                      });
                    }),
                Image.asset(
                  'images/pencil.png',
                  width: 40,
                  height: 40,
                ),
              ],
            ),
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: '목록을 입력 하세요.',
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                if (textEditingController.text.trim().isNotEmpty) {
                  addList();
                }
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }

//---Function
  addList() {
    WareHouse.imagePath = imgPath;
    WareHouse.workList = textEditingController.text;
    WareHouse.action = true; // 지금 생성된 데이터라는걸 구분하는 역할!

    // todolist 한번에 보내기
    // WareHouse.todolist = TodoList(
    //     imagePath: imgPath, workList: textEditingController.text);
  } // addlist

} //