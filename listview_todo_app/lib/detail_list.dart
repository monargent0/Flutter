import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_todo_app/warehouse.dart';

class DetailList extends StatefulWidget {
  const DetailList({Key? key}) : super(key: key);

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Detail View'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              WareHouse.todolist.imagePath,
              // WareHouse.imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              WareHouse.todolist.workList,
              // WareHouse.workList,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
                ),
              ),
          ],
        ),
      ),
    );
  }
}