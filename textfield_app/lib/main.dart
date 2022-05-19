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

  //Property
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();    
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 화면 내 어디를 눌러도 커서를 비 활성화 시킴, 키보드 내려가게 하기 위함@
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Single Textfield'),
          ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: textEditingController, 
                decoration: const InputDecoration(labelText: "글자를 입력하세요",),
                keyboardType: TextInputType.text, // number 숫자만 입력 . 기본타입은 Text
                
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                // 사용자의 입력 내용 확인
                // 정상입력 / 잘못입력 두가지 케이스
                if(textEditingController.text.trim().isEmpty){ // 공백 삭제 중요!
                  errorSnackBar(context); 
                }else{
                  showSnackBar(context);
                }
    
              }, 
              child: const Text('출력'))
            ],
          ),
        ),
      ),
    );
  }
//--- Functions
// Desc : 정상적으로 입력한 글자 보여주기
showSnackBar(BuildContext context){
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('입력한 글자는 ${textEditingController.text} 입니다'),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.lightBlue,
      )
  );

}

// Desc : 텍스트 필드에 입력을 안하고 버튼을 눌렀을 경우
errorSnackBar(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('글자를 입력하세요'),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.pink,
      )
  );
}

}//end