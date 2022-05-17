import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator_ex_app/Pages/firstpage.dart';
import 'package:navigator_ex_app/Pages/secondpage.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 217, 247),
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstPage(),
                    )); 
              },
              icon: const Icon(
                Icons.add_to_photos_rounded,
                color: Color.fromARGB(255, 247, 104, 152),
              ),
              label: const Text(
                'Bori Zone',
              ),
              style: OutlinedButton.styleFrom(
                primary: const Color.fromARGB(255, 250, 61, 124),
                backgroundColor: Colors.white,
                minimumSize: const Size(200, 40)
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    )); 
              },
              icon: const Icon(
                Icons.air_rounded,
                size: 20,
              ),
              label: const Text('Go to HeroZone'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, minimumSize: const Size(200, 40)),
            ),
          ],
        ),
      ),
    );
  }
}
