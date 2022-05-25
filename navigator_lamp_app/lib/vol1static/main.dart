import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/vol1static/edit.dart';
import 'package:navigator_lamp_app/vol1static/warehouse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // property
  late TextEditingController controller;
  late String imgPath;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    imgPath = 'images/lamp_on.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main 화면',
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
            // 왼쪽에 표시 아이콘 한개만 가능
            onPressed: () {
              //
            },
            icon: const Icon(Icons.home)),
        actions: [
          IconButton(
              onPressed: () {
                
                WareHouse.inputTxt = controller.text;
                
                Navigator.push(context, 
                MaterialPageRoute(builder: (context){
                  return const Edit();
                },
                )).then((value) => rebuildImg());
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(labelText: '글자를 입력 하세요.'),
                  keyboardType: TextInputType.text,

                ),
              ),
              Image.asset(
                imgPath,
                width: 180,
                height: 350,
              )
            ],
          ),
        ),
      ),
    );
  }
//--- Function

// 사진 , txt 새로고침
rebuildImg(){
  setState(() {
    if(WareHouse.lampStatus == true){
      imgPath = 'images/lamp_on.png';
      controller.text = WareHouse.inputTxt;
    }else{
      imgPath = 'images/lamp_off.png';
      controller.text = WareHouse.inputTxt;
    }
  });
}



} // end
