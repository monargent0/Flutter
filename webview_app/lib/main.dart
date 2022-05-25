import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
        primarySwatch: Colors.teal,
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

class _MyHomePageState extends State<MyHomePage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true; // for indicator
  String siteName = 'www.daum.net';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Column(
            children: [
              const Text('WebView'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          siteName =
                              'www.google.com'; // 단순하게 사이트 주소만 써주면 바뀌지 않는다!
                        });
                        // 웹사이트는 한번 뜨면 연결이 끊어져 있기 때문에 다시 연결해주는 함수 만들어 쓴다
                        _reloadSite();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      child: const Text('Google')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          siteName =
                              'www.naver.com'; // 단순하게 사이트 주소만 써주면 바뀌지 않는다!
                        });
                        // 웹사이트는 한번 뜨면 연결이 끊어져 있기 때문에 다시 연결해주는 함수 만들어 쓴다
                        _reloadSite();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      child: const Text('Naver')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          siteName =
                              'www.daum.net'; // 단순하게 사이트 주소만 써주면 바뀌지 않는다!
                        });
                        // 웹사이트는 한번 뜨면 연결이 끊어져 있기 때문에 다시 연결해주는 함수 만들어 쓴다
                        _reloadSite();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      child: const Text('Daum')),
                ],
              ),
            ],
          ),
        ),
        toolbarHeight: 100,
      ),
      body: Stack(
        // x,y,z 좌표 중 z 좌표로 쌓임
        children: [
          WebView(
            initialUrl: 'http://$siteName',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller
                  .complete(webViewController); // 내 컨트롤러가 다 불러오면 웹컨트롤러가 역할할거임
            }, // 여기까지 화면
            // 여기부터는 indicator
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (start) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
      // 내가 원래 있던 위치를 아는게 스냅 샷!
      // 뒤로가기 버튼을 플로팅으로 만들기
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              backgroundColor: Colors.amberAccent,
              onPressed: () {
                controller.data!.goBack();
              },
              child: const Icon(Icons.arrow_back_ios),
            );
          }
          return Stack();
        },
      ),
    );
  }

//---Function
  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  } //

} //end
