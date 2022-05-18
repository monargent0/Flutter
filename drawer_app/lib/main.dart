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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer기능은 scaffold가 가지고 있다
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      body: const Center(
        child: Text('Drawer'),
      ),

      drawer: Drawer(
        backgroundColor: Colors.amber,
        child: ListView(
          padding: EdgeInsets.zero, // zero 값으로 주면 상단바까지 헤더가 차지함
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-2.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/pikachu-3.jpg'),
                ),
              ],
              accountName: Text('Pikachu'),
              accountEmail: Text('Pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              onTap: (){
                // 
              },
              leading: const Icon(
                Icons.home_filled,
                color: Colors.blueGrey,
              ),
              title: const Text('Home',),
              trailing: const Icon(
                Icons.add,
              ),
            )
          ],
        ),
      ),
    );
  }
}
