import 'package:flutter/material.dart';
import 'package:listview_app/model/animal_item.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  const SecondPage({Key? key, required this.list}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // property
  final namecontroller =
      TextEditingController(); // dart 스타일  late TextEditingController 어쩌고 안해도 된다. (init에도 안써도 됨)
  int _radioValue = 0;
  bool flyExist = false;
  var _imagePath;
  String imageName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: namecontroller,
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _radioChange,
                ),
                const Text('영장류'),
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _radioChange,
                ),
                const Text('파충류'),
                Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: _radioChange,
                ),
                const Text('포유류'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('날 수 있나요?'),
                Checkbox(
                    value: flyExist,
                    onChanged: (check) {
                      setState(() {
                        flyExist = check!; // ! ; null safety
                      });
                    })
              ],
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/cow.png';
                      setState(() {
                        imageName = '젖소 선택';
                      });
                    },
                    child: Image.asset(
                      'images/cow.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/pig.png';
                      setState(() {
                        imageName = '돼지 선택';
                      });
                    },
                    child: Image.asset(
                      'images/pig.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/bee.png';
                      setState(() {
                        imageName = '벌 선택';
                      });
                    },
                    child: Image.asset(
                      'images/bee.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/cat.png';
                      setState(() {
                        imageName = '고양이 선택';
                      });
                    },
                    child: Image.asset(
                      'images/cat.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/dog.png';
                      setState(() {
                        imageName = '강아지 선택';
                      });
                    },
                    child: Image.asset(
                      'images/dog.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/fox.png';
                      setState(() {
                        imageName = '여우 선택';
                      });
                    },
                    child: Image.asset(
                      'images/fox.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/monkey.png';
                      setState(() {
                        imageName = '원숭이 선택';
                      });
                    },
                    child: Image.asset(
                      'images/monkey.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = 'images/wolf.png';
                      setState(() {
                        imageName = '늑대 선택';
                      });
                    },
                    child: Image.asset(
                      'images/wolf.png',
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(imageName,),
            ),
            ElevatedButton(
              onPressed: () {
                var animal = Animal(
                  animalName: namecontroller.text, 
                  kind: getKind(_radioValue), 
                  imagePath: _imagePath, 
                  flyExist: flyExist);

                // dialog 띄우기 ; dialog 띄우는 방법 2  but showdialog가 편할거임
                // showdialog 가 프레임 alertdialog는 내용 
                AlertDialog dialog = AlertDialog(
                  title: const Text('동물 추가하기'),
                  content: Text(
                    '이 동물은 ${animal.animalName}입니다.\n'
                    '또 동물의 종류는 ${animal.kind}입니다.\n'
                    '이 동물은 ${animal.flyExist ? "날 수 있습니다." : "날 수 없습니다."}\n'
                    '이 동물을 추가 하시겠습니까?',
                    style: const TextStyle(fontSize: 17,),
                  ),
                  actions: [
                    TextButton(onPressed: () {
                      widget.list.add(animal);
                      Navigator.of(context).pop();
                    }, 
                    child: const Text('예')
                    ),
                    TextButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, 
                    child: const Text('아니요',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                    )
                    ),
                  ],
                );

                showDialog(
                  context: context, 
                  builder: (BuildContext context){
                    return dialog;
                  });

              }, 
              child: const Text('동물 추가하기',)
              ),

          ],
        ),
      ),
    );
  }

  //----Function
  // radio 버튼
  _radioChange(int? value) {
    // ? ; null safety
    setState(() {
      _radioValue = value!; // ! ; null 해제 (??? 몬소린지 모르겠음 걍 외우기)
    });
  } // radioChange

  // kind
  getKind(int radioValue){
    switch(radioValue){
      case 0: return '영장류';
      case 1: return '파충류';
      case 2: return '포유류';
    }
  }

} //end
