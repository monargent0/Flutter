import 'dart:convert'; // json autoimport
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // 이 부분 입력 해줘야 한다@

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
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List data;

  // 랜덤 사이즈
  late double randomNumber;
  Random random = Random();
  late List num;
  late List randomIndex;

  @override
  void initState() {
    super.initState();
    data = [];
    // 네트워크를 통해 데이터를 가져온다 !
    getJsonData(); // Fucntion

    // 랜덤 사이즈
    num = [];
    // randomindex
    randomIndex = [];
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Json Test'),
          elevation: 0,
        ),
        body: Center(
          // indicator 가 센터에서 돌게 하기 위함
          child: data.isEmpty
              ? const Text('data가 없습니다.')
              : ListView.builder(
                  itemCount: (data.length/2).floor()  , //(data.length/2).floor() 
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Card(
                                    color: index % 2 == 1
                                        ? Colors.brown[100]
                                        : Colors.amberAccent[100],
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 5),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            data[index * 2]['image'],
                                            height: 80,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            data[index * 2]['title'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Card(
                                    color: index % 2 == 1
                                        ? Colors.teal[100]
                                        : Colors.redAccent[100],
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 8, 5),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            data[index * 2 + 1]['image'],
                                            height: 80,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            data[index * 2 + 1]['title'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Card(
                            color: index % 2 == 1
                                ? Colors.grey[100]
                                : Colors.lightGreen[100],
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    data[randomIndex[index]]['image'],
                                    // height: 80,
                                    width: num[index],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  // Text(
                                  //   data[index]['title'],
                                  //   style: const TextStyle(
                                  //   fontWeight: FontWeight.bold),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
        ));
  }

//--- Function
// 비동기 방식으로 만들어서 빌드와 동시에 작동하도록 한다 @ ;
// Future , aysnc , await 이 있어야 비동기 구조이다
  Future<bool> getJsonData() async {
    var url = Uri.parse(
        'https://zeushahn.github.io/Test/movies.json'); // localhost: 들어가면 된다 , get 방식
    // post도 있지만 권장하지 않는다 (get으로 해야 압축하고 암호화가 가능하다 ,,??)
    var response =
        await http.get(url); // 빌드가 끝날 때까지 기다려라! ; 빌드할때 데이터가 먼저와서 출력할게 없는 참사 방지
    var dataConvertedJSON =
        json.decode(utf8.decode(response.bodyBytes)); // 한글 깨짐 방지 @
    // json map타입으로 변경 decode해줌 , 키 값을 사용할 수 있어진다. (map은 키값으로 불러와야 한다! 숫자로 못불러옴)
    List result = dataConvertedJSON['results'];

    setState(() {
      data.addAll(result); // List를 한번에 통째로 추가한다
    });

    // 가져온 값 확인용 print
    // print(data[0]['code']);
    // print(result); // 첫번째 코드값 가져올 때 result[0]['code']
    // print(response.body);

    // 랜덤 
    for (int i = 0; i < data.length; i++) {
      randomNumber = random.nextDouble() * 100 + 30; // 10~110
      num.add(randomNumber);
    }

    for(int i = 0 ; i < data.length ; i++){
      int randomN = random.nextInt(data.length);
      randomIndex.add(randomN);
    }

    return true;
  }
} // end
