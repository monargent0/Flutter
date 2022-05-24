import 'package:flutter/material.dart';
import 'package:listview_app/model/animal_item.dart';
// class 를 새로 만들때 데이터를 넣어줘서 페이지를 만드는 방식 
class FirstPage extends StatefulWidget {
  final List<Animal> list;
  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.list.length ,
          itemBuilder: (context, position){
            return GestureDetector(
              onTap: () {
                String name = widget.list[position].animalName;
                String kind = widget.list[position].kind;
                showAnimal(context, name , kind , widget.list[position]);
              },
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      widget.list[position].imagePath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "      ${widget.list[position].animalName}",
                    )
                  ],
                ),
              ),
            );
          },
        )
        ),
    );
  }
//---function
// 동물정보 알림창
showAnimal(BuildContext context , String name, String kind , Animal animal){
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (BuildContext ctx ){
      return AlertDialog(
        title: Text(name) ,
        content: Text('이 동물은 $kind 입니다'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            }, 
            child: const Text('확인'))
        ],
      );
    } 
    );
}

}// 