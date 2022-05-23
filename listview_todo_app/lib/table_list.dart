import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_todo_app/detail_list.dart';
import 'package:listview_todo_app/todo_list.dart';
import 'package:listview_todo_app/warehouse.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  List<TodoList> todolist = [];

  @override
  void initState() {
    super.initState();
    todolist.add(TodoList(
        imagePath: 'images/cart.png', workList: '책 구매')); // 생성자 모양대로 초기값 입력
    todolist.add(TodoList(
        imagePath: 'images/clock.png', workList: '철수와 약속')); // 생성자 모양대로 초기값 입력
    todolist.add(TodoList(
        imagePath: 'images/pencil.png',
        workList: '스터디 준비하기')); // 생성자 모양대로 초기값 입력
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Main View'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(Icons.add_outlined)),
        ],
      ),
      // List View 중요함@@ ; (스크롤 자동으로 해줌)
      body: Center(
        child: ListView.builder(
            itemCount: todolist.length,
            itemBuilder: (context, position) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                child: GestureDetector(
                  onTap: () {
                    WareHouse.workList = todolist[position].workList;
                    WareHouse.imagePath = todolist[position].imagePath;
                    //---
                    WareHouse.todolist = todolist[position];
                    //---
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailList(),
                        ));
                  },
                  child: Card(
                    color: position % 2 == 0
                        ? Colors.amberAccent[100]
                        : Colors.lightGreen[200],
                    child: Row(
                      children: [
                        Image.asset(
                          todolist[position].imagePath,
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          todolist[position].workList,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
