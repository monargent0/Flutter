import 'package:flutter/material.dart';
import 'package:listview_ex_app/model/flag.dart';

class FirstPage extends StatefulWidget {
  final List<Flag> list;
  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: ListView.builder(
          itemCount: widget.list.length ,
          itemBuilder: (context, position){
            return GestureDetector(
              onTap: () {
                showNation(context,widget.list[position]);
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
                      "    ${widget.list[position].nation.substring(0,1)}${"_"*(widget.list[position].nation.length- 1)}",
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
// 국기정보 알림창
showNation(BuildContext context , Flag flag){
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (BuildContext ctx ){
      return AlertDialog(
        title: const Text('국가명') ,
        content: Text('이 국기는 ${flag.nation} 국기 입니다'),
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

} //