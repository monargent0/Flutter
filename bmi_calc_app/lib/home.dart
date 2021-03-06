import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 1,
              ),
              const Text(
                'MY BMI Calculator',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    color: Colors.lightBlueAccent),
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'images/bmi.png',
                width: 250,
                height: 250,
              ),
              const SizedBox(
                height: 1,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/input');
                },
                icon: const Icon(
                  Icons.arrow_right_alt_rounded,
                  color: Color.fromARGB(255, 247, 104, 152),
                ),
                label: const Text(
                  '계산하러 가기',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,)
                ),
                style: OutlinedButton.styleFrom(
                    minimumSize: const Size(180, 50),
                    primary: const Color.fromARGB(255, 247, 104, 152),
                    backgroundColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35))),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
