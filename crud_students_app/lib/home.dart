import 'dart:convert';

import 'package:crud_students_app/delete.dart';
import 'package:crud_students_app/update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllList extends StatefulWidget {
  const AllList({Key? key}) : super(key: key);

  @override
  State<AllList> createState() => _AllListState();
}

class _AllListState extends State<AllList> {
  late List data;

  @override
  void initState() {
    super.initState();
    data = []; // network 이용
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD for Students'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, '/insert')
                      .then((value) => getJSONData());
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
          child: data.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DeleteS(data: data[index]); // Map으로 보내
                            },
                          )).then((value) => getJSONData());
                        });
                      },
                      onTap: () {
                        setState(() {
                         Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return UpdateS(data: data[index]); // Map으로 보내 
                            },
                          )).then((value) => getJSONData());
                        });
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 5),
                              child: Row(
                                children: [
                                  const Text(
                                    'Code : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(data[index]['code']),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                              child: Row(
                                children: [
                                  const Text(
                                    'Name : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(data[index]['name']),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                              child: Row(
                                children: [
                                  const Text(
                                    'Dept : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(data[index]['dept']),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 5, 8, 8),
                              child: Row(
                                children: [
                                  const Text(
                                    'Phone : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(data[index]['phone']),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
    );
  }

// Function
  Future<bool> getJSONData() async {
    data = []; // 초기화
    var url =
        Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');

    var response = await http.get(url); // 빌드가 끝날 때까지 기다려
    var dataConvertedJSON =
        json.decode(utf8.decode(response.bodyBytes)); // 한글깨짐방지, map방식으로 변환

    List result = dataConvertedJSON['results'];

    setState(() {
      data.addAll(result);
    });

    return true;
  }
} // end
