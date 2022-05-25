import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  final String inputTxt;
  final bool lampStatus;
  const Edit({Key? key, required this.inputTxt , required this.lampStatus }) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController editController;
  late bool switchlamp;
  late String lampLable;

  List status = [];

  @override
  void initState() {
    super.initState();

    editController = TextEditingController(text: widget.inputTxt);

    if (widget.lampStatus == true) {
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
                  status.add(switchlamp);
                  status.add(editController.text);
                  
                  Navigator.pop(context , status);

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
