import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Property
  late TextEditingController num1;
  late TextEditingController num2;
  late TextEditingController addresult;
  late TextEditingController subresult;
  late TextEditingController mulresult;
  late TextEditingController divresult;
  late bool switchValue1;
  late bool switchValue2;
  late bool switchValue3;
  late bool switchValue4;

  @override
  void initState() {
    num1 = TextEditingController();
    num2 = TextEditingController();
    addresult = TextEditingController();
    subresult = TextEditingController();
    mulresult = TextEditingController();
    divresult = TextEditingController();
    switchValue1 = false;
    switchValue2 = false;
    switchValue3 = false;
    switchValue4 = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('간단한 계산기')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: num1,
                  decoration: const InputDecoration(
                    labelText: "첫번째 숫자를 입력하세요",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.purple),
                    ),
                  ),
                  keyboardType:
                      TextInputType.number, // number 숫자만 입력 . 기본타입은 Text
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: num2,
                  decoration: const InputDecoration(
                    labelText: "두번째 숫자를 입력하세요",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.purple),
                    ),
                  ),
                  keyboardType:
                      TextInputType.number, // number 숫자만 입력 . 기본타입은 Text
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // 정상입력 / 잘못입력 두가지 케이스
                        if (num1.text.trim().isEmpty ||
                            num2.text.trim().isEmpty) {
                          // 공백 삭제 중요!
                          errorSnackBar(context);
                        } else {
                          // calcAll(context); // 계산하기를 누르면 스위치 전부가 켜지면서 계산결과 출력
                          addcalc(context);
                          subcalc(context);
                          mulcalc(context);
                          divcalc(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent),
                      child: const Text('계산하기'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        removeAll(context);
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.pink),
                      child: const Text(
                        '지우기',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('덧셈'),
                    Switch(
                      value: switchValue1, // 화면에 보여지는 value
                      onChanged: (value) {
                        // 사용자가 움직이는 값. 변수 이름은 value가 아니어도 된다.
                        if (num1.text.trim().isEmpty ||
                            num2.text.trim().isEmpty) {
                          errorSnackBar(context);
                        } else {
                          setState(() {
                            switchValue1 = value;
                            addcalc(context);
                          });
                        }
                      },
                    ),
                    const Text('뺄셈'),
                    Switch(
                      value: switchValue2, // 화면에 보여지는 value
                      onChanged: (value) {
                        // 사용자가 움직이는 값. 변수 이름은 value가 아니어도 된다.
                        if (num1.text.trim().isEmpty ||
                            num2.text.trim().isEmpty) {
                          errorSnackBar(context);
                        } else {
                          setState(() {
                            switchValue2 = value;
                            subcalc(context);
                          });
                        }
                      },
                    ),
                    const Text('곱셈'),
                    Switch(
                      value: switchValue3, // 화면에 보여지는 value
                      onChanged: (value) {
                        // 사용자가 움직이는 값. 변수 이름은 value가 아니어도 된다.
                        if (num1.text.trim().isEmpty ||
                            num2.text.trim().isEmpty) {
                          errorSnackBar(context);
                        } else {
                          setState(() {
                            switchValue3 = value;
                            mulcalc(context);
                          });
                        }
                      },
                    ),
                    const Text('나눗셈'),
                    Switch(
                      value: switchValue4, // 화면에 보여지는 value
                      onChanged: (value) {
                        // 사용자가 움직이는 값. 변수 이름은 value가 아니어도 된다.
                        if (num1.text.trim().isEmpty ||
                            num2.text.trim().isEmpty) {
                          errorSnackBar(context);
                        } else {
                          setState(() {
                            switchValue4 = value;
                            divcalc(context);
                          });
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: addresult,
                  decoration: const InputDecoration(
                    labelText: "덧셈 결과",
                  ),
                  readOnly: true, // number 숫자만 입력 . 기본타입은 Text
                ),
                TextField(
                  controller: subresult,
                  decoration: const InputDecoration(
                    labelText: "뺄셈 결과",
                  ),
                  readOnly: true, // number 숫자만 입력 . 기본타입은 Text
                ),
                TextField(
                  controller: mulresult,
                  decoration: const InputDecoration(
                    labelText: "곱셈 결과",
                  ),
                  readOnly: true, // number 숫자만 입력 . 기본타입은 Text
                ),
                TextField(
                  controller: divresult,
                  decoration: const InputDecoration(
                    labelText: "나눗셈 결과",
                  ),
                  readOnly: true, // number 숫자만 입력 . 기본타입은 Text
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// Function

// Desc : 사칙연산 계산
  calcAll(BuildContext context) {
    setState(() {
      switchValue1 = true;
      switchValue2 = true;
      switchValue3 = true;
      switchValue4 = true;
    });
    int result = int.parse(num1.text) + int.parse(num2.text);
    addresult.text = result.toString();
    result = int.parse(num1.text) - int.parse(num2.text);
    subresult.text = result.toString();
    result = int.parse(num1.text) * int.parse(num2.text);
    mulresult.text = result.toString();
    double result2 = int.parse(num1.text) / int.parse(num2.text);
    divresult.text = result2.toStringAsFixed(5).toString();
  }

  // 사칙연산 각자 계산
  addcalc(BuildContext context) {
    if (switchValue1 == true) {
      int result = int.parse(num1.text) + int.parse(num2.text);
      addresult.text = result.toString();
    } else if (switchValue1 == false) {
      addresult.text = '';
    }
  }

  subcalc(BuildContext context) {
    if (switchValue2 == true) {
      int result = int.parse(num1.text) - int.parse(num2.text);
      subresult.text = result.toString();
    } else if (switchValue2 == false) {
      subresult.text = '';
    }
  }

  mulcalc(BuildContext context) {
    if (switchValue3 == true && num1.text.isNotEmpty && num2.text.isNotEmpty) {
      int result = int.parse(num1.text) * int.parse(num2.text);
      mulresult.text = result.toString();
    } else if (switchValue3 == false) {
      mulresult.text = '';
    }
  }

  divcalc(BuildContext context) {
    if (switchValue4 == true) {
      double result2 = int.parse(num1.text) / int.parse(num2.text);
      divresult.text = result2.toStringAsFixed(5).toString();
    } else if (switchValue4 == false) {
      divresult.text = '';
    }
  }

// Desc : 텍스트 필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요!'),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
    ));
  }

// Desc : 결과 모두 지우기
  removeAll(BuildContext context) {
    num1.text = '';
    num2.text = '';
    addresult.text = '';
    subresult.text = '';
    mulresult.text = '';
    divresult.text = '';
  }
} //End
