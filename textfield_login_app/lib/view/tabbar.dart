import 'package:flutter/material.dart';
import 'package:textfield_login_app/model/animal_item.dart';
import 'package:textfield_login_app/view/first_page.dart';
import 'package:textfield_login_app/view/second_page.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Tabbar 쓸거임
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // property
  late TabController controller; // 탭바 만들거
  List<Animal> animalList = []; // 동물 정보 만들거

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(Animal(
        animalName: '벌',
        kind: '곤충류',
        imagePath: 'images/bee.png',
        flyExist: true));
    animalList.add(Animal(
        animalName: '고양이',
        kind: '포유류',
        imagePath: 'images/cat.png',
        flyExist: false));
    animalList.add(Animal(
        animalName: '젖소',
        kind: '포유류',
        imagePath: 'images/cow.png',
        flyExist: false));
    animalList.add(Animal(
        animalName: '강아지',
        kind: '포유류',
        imagePath: 'images/dog.png',
        flyExist: false));
    animalList.add(Animal(
        animalName: '여우',
        kind: '포유류',
        imagePath: 'images/fox.png',
        flyExist: false));
    animalList.add(Animal(
        animalName: '원숭이',
        kind: '영장류',
        imagePath: 'images/monkey.png',
        flyExist: false));
    animalList.add(Animal(
        animalName: '돼지',
        kind: '포유류',
        imagePath: 'images/pig.png',
        flyExist: false));
    animalList.add(Animal(
        animalName: '늑대',
        kind: '포유류',
        imagePath: 'images/fox.png',
        flyExist: false));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Test'),
      ),
      body: TabBarView(controller: controller, children: [
        FirstPage(list: animalList), // 생성자 ; 이때 첫번째 페이지가 만들어진다. 만들때 animal
        SecondPage(list: animalList),
      ]),
      bottomNavigationBar: Container(
        color: Colors.brown,
        height: 60,
        child: TabBar(controller: controller, tabs: const [
          Tab(
            icon: Icon(
              Icons.looks_one_rounded,
              color: Colors.amberAccent,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.looks_two_rounded,
              color: Colors.orange,
            ),
          ),
        ]),
      ),
    );
  }
}
