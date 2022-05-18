import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mail extends StatelessWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        elevation: 0,
        title: const Text('Mail'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/send');
              },
              icon: const Icon(Icons.email_rounded)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/receive');
              },
              icon: const Icon(Icons.email_outlined)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/send');
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightGreen)),
              child: const Text(
                '보낸 편지함',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/receive');
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink)),
              child: const Text(
                '받은 편지함',
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/bori2.jpeg'),
                ),
              ],
              accountName: Text('Pikachu'),
              accountEmail: Text('Pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/send');
              },
              leading: const Icon(
                Icons.mail,
                color: Colors.lightGreen,
              ),
              title: const Text(
                '보낸 편지함',
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/receive');
              },
              leading: const Icon(
                Icons.mail_outline,
                color: Colors.pink,
              ),
              title: const Text(
                '받은 편지함',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
