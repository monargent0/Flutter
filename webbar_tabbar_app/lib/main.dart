import 'package:flutter/material.dart';
import 'package:webbar_tabbar_app/webview.dart';

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
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  late TabController tabcontroller;
  @override
  void initState() {
    tabcontroller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView - Tabbar',),
      ),
      body: TabBarView(
        controller: tabcontroller,
        children: const [Web(siteName: 'www.naver.com') , Web(siteName: 'www.google.com'), Web(siteName: 'www.daum.net')],
        ),
      bottomNavigationBar: Container(
        color: Colors.white60,
        height: 100,
        child: TabBar(
          controller: tabcontroller,
          labelColor: Colors.blueAccent,
          indicatorColor: Colors.red,
          tabs:  [
            Tab(
            icon: Image.asset('images/naver.png' , width: 25, height: 25,),
            text: 'Naver',
            ),
            Tab(
            icon: Image.asset('images/google.png' , width: 25, height: 25,),
            text: 'Google',
            ),
            Tab(
            icon: Image.asset('images/daum.png' , width: 25, height: 25,),
            text: 'Daum',
            ),
            ]
          ),
        ),
    );
    
  }
}