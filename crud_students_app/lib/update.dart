import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateS extends StatefulWidget {
  final Map data;
  const UpdateS({Key? key , required this.data  }) : super(key: key);

  @override
  State<UpdateS> createState() => _UpdateSState();
}

class _UpdateSState extends State<UpdateS> {
   // property
  late TextEditingController codeController;
  late TextEditingController nameController;
  late TextEditingController deptController;
  late TextEditingController phoneController;

  late String code;
  late String name;
  late String dept;
  late String phone;
  late String result;

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();
    nameController = TextEditingController();
    deptController = TextEditingController();
    phoneController = TextEditingController();

    result = '';

    codeController.text = widget.data['code'];
    nameController.text = widget.data['name'];
    deptController.text = widget.data['dept'];
    phoneController.text = widget.data['phone'];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update for CRUD'),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: codeController,
                decoration: const InputDecoration(labelText: '학번 입니다'),
                readOnly: true,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: '성명을 수정하세요'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: deptController,
                decoration: const InputDecoration(labelText: '전공을 수정하세요'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: '전화번호를 수정하세요'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    code = codeController.text;
                    name = nameController.text;
                    dept = deptController.text;
                    phone = phoneController.text;

                    updateAction();

                  },
                  child: const Text('수정')),
            ],
          ),
        ),
      ),
    );
  }

//--- Function
  Future<String> updateAction() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_update_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone'
        // get 방식으로 데이터 받아와서 넘기기
        );
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
      
      if (result == 'OK') {
        _showDialog(context);
      } else {
        errorSnackBar(context);
      }
      
    });

    return result;
  } // insert

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('수정 결과'),
            content: const Text('수정이 완료 되었습니다.'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('확인'))
            ],
          );
        });
  } //showDialog

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 정보 수정에 문제가 생겼습니다'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      ),
    );
  } // error

} // end