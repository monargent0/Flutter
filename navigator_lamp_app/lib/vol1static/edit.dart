import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/vol1static/warehouse.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController editController;
  late bool switchlamp;
  late String lampLable;

  @override
  void initState() {
    super.initState();

    editController = TextEditingController();
    editController.text = WareHouse.inputTxt;

    if (WareHouse.lampStatus == true) {
      switchlamp = true;
      lampLable = 'On';
    } else {
      switchlamp = false;
      lampLable = 'Off';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: editController,
                  //decoration: const InputDecoration(labelText: '글자를 입력 하세요.'),
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(lampLable),
                    Switch(
                      value: switchlamp,
                      onChanged: (value) {
                        setState(() {
                          switchlamp = value;
                          if (switchlamp == true) {
                            lampLable = 'On';
                          } else {
                            lampLable = 'Off';
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // if(editController.text.trim().isNotEmpty){
                  WareHouse.lampStatus = switchlamp;
                  WareHouse.inputTxt = editController.text;
                  
                  Navigator.pop(context);
                  // }

                }, 
                child: const Text('OK')
                ),
            ],
          ),
        ),
      ),
    );
  }
}
