import 'package:bmi_calc_app/massage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  // late double result;
  late TextEditingController resultT;
  late String txt;
  late String pic;
  late bool switchValue;

  @override
  void initState() {
    resultT = TextEditingController();
    txt = '';
    pic = 'images/shh.png';
    switchValue = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI 계산 결과'),
        backgroundColor: Colors.amber[100],
        elevation: 0,
        foregroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(
              //   height: 100,
              // ),

              SizedBox(
                width: 100,
                child: TextField(
                  controller: resultT,
                  decoration: const InputDecoration(
                    labelText: "BMI 결과",
                  ),
                  readOnly: true, // number 숫자만 입력 . 기본타입은 Text
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                txt,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  calc(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                child: const Text(
                  '결과보기',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                pic,
                width: 200,
                height: 350,
              ),
            ],
          ),
        ),
      ),
    );
  }

  calc(BuildContext context) {
    double tall = int.parse(Massage.tall) / 100;
    double result = int.parse(Massage.kg) / (tall * tall);
    resultT.text = result.toStringAsFixed(1).toString();

    if (result <= 18.4) {
      setState(() {
        txt = '저체중 입니다.';
        pic = 'images/one.png';
      });
    } else if (result <= 22.9) {
      setState(() {
        txt = '정상체중 입니다.';
        pic = 'images/two.png';
      });
    } else if (result <= 24.9) {
      setState(() {
        txt = '과체중 입니다.';
        pic = 'images/three.png';
      });
    } else if (result <= 29.9) {
      setState(() {
        txt = '비만 입니다.';
        pic = 'images/four.png';
      });
    } else {
      setState(() {
        txt = '고도비만 입니다.';
        pic = 'images/five.png';
      });
    }
  }
}//