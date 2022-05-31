import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Iris(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Iris extends StatefulWidget {
  const Iris({Key? key}) : super(key: key);

  @override
  State<Iris> createState() => _IrisState();
}

class _IrisState extends State<Iris> {
  final sepalLcontroller = TextEditingController();
  final sepalWcontroller = TextEditingController();
  final petalLcontroller = TextEditingController();
  final petalWcontroller = TextEditingController();

  late String species;
  late String spL;
  late String spW;
  late String ptL;
  late String ptW;

  @override
  void initState() {
    super.initState();
    species = 'all';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iris 품종 예측'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: sepalLcontroller,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    maxLines: 1,
                    decoration: const InputDecoration(
                        labelText: 'Sepal Length의 크기를 입력하세요.'),
                  ),
                  TextField(
                    controller: sepalWcontroller,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    maxLines: 1,
                    decoration: const InputDecoration(
                        labelText: 'Sepal Width의 크기를 입력하세요.'),
                  ),
                  TextField(
                    controller: petalLcontroller,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    maxLines: 1,
                    decoration: const InputDecoration(
                        labelText: 'Petal Length의 크기를 입력하세요.'),
                  ),
                  TextField(
                    controller: petalWcontroller,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    maxLines: 1,
                    decoration: const InputDecoration(
                        labelText: 'Petal Width의 크기를 입력하세요.'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              sepalLcontroller.text = '';
                              sepalWcontroller.text = '';
                              petalLcontroller.text = '';
                              petalWcontroller.text = '';
                              species = 'all';
                            });
                          },
                          child: const Text('초기화')),
                      ElevatedButton(
                          onPressed: () {
                            spL = sepalLcontroller.text;
                            spW = sepalWcontroller.text;
                            ptL = petalLcontroller.text;
                            ptW = petalWcontroller.text;

                            predictiris();
                          },
                          child: const Text('입력')),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('images/$species.jpg'),
                    radius: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //---function
  Future<String> predictiris() async {
    var url = Uri.parse(
        'http://localhost:8080/Rserve/response_iris.jsp?sepalLength=$spL&sepalWidth=$spW&petalLength=$ptL&petalWidth=$ptW');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    setState(() {
      species = dataConvertedJSON['result'];
      _resultDialog(context);
    });

    print(species);

    return species;
  } //

// 수정 완료 후 List로 pop
  _resultDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('* 품종 예측 결과 *'),
            content: Text('입력한 데이터의 품종은 $species 입니다.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Center(child: Text('확인')),
              ),
            ],
          );
        });
  }
} // end