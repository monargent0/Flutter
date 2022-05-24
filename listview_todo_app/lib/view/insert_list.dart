import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_todo_app/model/warehouse.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  // property
  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
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
              onPressed: (){
                if(textEditingController.text.trim().isNotEmpty){
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
addList(){
  WareHouse.imagePath = 'images/pencil.png';
  WareHouse.workList = textEditingController.text;
} // addlist

} //