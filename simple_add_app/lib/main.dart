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
  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;
  late int result;
  late String resultTxt;

  @override
  void initState() {
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    result = 0;
    resultTxt = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 사칙연산 계산기'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Text('계산 결과 : $result',
              // style: const TextStyle(
              //   fontSize: 22,
              // ), 
              // ),
              TextField(
                    controller: textEditingController1, 
                    decoration: const InputDecoration(labelText: "첫번째 숫자를 입력하세요",),
                    keyboardType: TextInputType.number, // number 숫자만 입력 . 기본타입은 Text

                  ),
              TextField(
                    controller: textEditingController2, 
                    decoration: const InputDecoration(labelText: "두번째 숫자를 입력하세요",),
                    keyboardType: TextInputType.number, // number 숫자만 입력 . 기본타입은 Text
                  ),
              const SizedBox(
                  height: 20,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                    // 정상입력 / 잘못입력 두가지 케이스
                    if(textEditingController1.text.trim().isEmpty | textEditingController2.text.trim().isEmpty){ // 공백 삭제 중요!
                      errorSnackBar(context); 
                    }else{
                      addCalc(context);
                    }
                    },
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                  width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                    // 정상입력 / 잘못입력 두가지 케이스
                    if(textEditingController1.text.trim().isEmpty || textEditingController2.text.trim().isEmpty){ // 공백 삭제 중요!
                      errorSnackBar(context); 
                    }else{
                      subCalc(context);
                    }
                    },
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(
                  width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                    // 정상입력 / 잘못입력 두가지 케이스
                    if(textEditingController1.text.trim().isEmpty || textEditingController2.text.trim().isEmpty){ // 공백 삭제 중요!
                      errorSnackBar(context); 
                    }else{
                      mulCalc(context);
                    }
                    },
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.close),
                  ),
                  const SizedBox(
                  width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                    // 정상입력 / 잘못입력 두가지 케이스
                    if(textEditingController1.text.trim().isEmpty | textEditingController2.text.trim().isEmpty){ // 공백 삭제 중요!
                      errorSnackBar(context); 
                    }else{
                      divCalc(context);
                    }
                    },
                    backgroundColor: Colors.red,
                    child: const Text('/', 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                ],
              ),
              // ElevatedButton.icon(
              //   onPressed: () {
              //     // 사용자의 입력 내용 확인
              //       // 정상입력 / 잘못입력 두가지 케이스
              //       if(textEditingController1.text.trim().isEmpty | textEditingController2.text.trim().isEmpty){ // 공백 삭제 중요!
              //         errorSnackBar(context); 
              //       }else{
              //         addCalc(context);
              //       }
              //   }, 
              //   style: ElevatedButton.styleFrom(minimumSize: const Size(300, 30),),
              //   icon: const Icon(Icons.add), 
              //   label: const Text('덧셈 계산')),
              // ElevatedButton.icon(
              //   onPressed: () {
              //     // 사용자의 입력 내용 확인
              //       // 정상입력 / 잘못입력 두가지 케이스
              //       if(textEditingController1.text.trim().isEmpty | textEditingController2.text.trim().isEmpty){ // 공백 삭제 중요!
              //         errorSnackBar(context); 
              //       }else{
              //         subCalc(context);
              //       }
              //   }, 
              //   style: ElevatedButton.styleFrom(minimumSize: const Size(300, 30),),
              //   icon: const Icon(Icons.remove), 
              //   label: const Text('뺄셈 계산')),
                const SizedBox(
                  height: 40,
                ),
                Text(resultTxt,
                style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ), 
              ),
              
            ],
          ),
        ),
      ),
    );
  }

// --- function
// Desc : 덧셈 계산 
addCalc(BuildContext context){
  setState(() {
    result = int.parse(textEditingController1.text) + int.parse(textEditingController2.text);
    resultTxt = '입력하신 숫자의 합은 $result 입니다';
  });
}
// Desc : 뺄셈 계산 
subCalc(BuildContext context){
  setState(() {
    result = int.parse(textEditingController1.text) - int.parse(textEditingController2.text);
    resultTxt = '입력하신 숫자의 차는 $result 입니다';
  });
}
// Desc : 곱셈 계산 
mulCalc(BuildContext context){
  setState(() {
    result = int.parse(textEditingController1.text) * int.parse(textEditingController2.text);
    resultTxt = '입력하신 숫자의 곱은 $result 입니다';
  });
}
// Desc : 나눗셈 계산 
divCalc(BuildContext context){
  setState(() {
    double result = int.parse(textEditingController1.text) / int.parse(textEditingController2.text);
    resultTxt = '입력하신 숫자의 나눗셈은 ${result.toStringAsFixed(3)} 입니다';
  });
}

// Desc : 텍스트 필드에 입력을 안하고 버튼을 눌렀을 경우
errorSnackBar(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('숫자를 입력하세요'),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.pink,
      )
  );
}


}//end