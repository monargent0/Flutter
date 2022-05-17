import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  //사용법 1 >
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Elevated Button is clicked'),
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.blueAccent,
                      ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: const Text('Snackbar Button'),),
              ElevatedButton(
                onPressed: () {
                  //사용법 1 >
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Elevated Button is clicked', 
                      style: TextStyle(
                        color: Colors.amberAccent
                      ),
                      ),
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.redAccent,
                      ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                ),
                child: const Text('Snackbar Button'),),
            ],
          ),
    );
  }
}
