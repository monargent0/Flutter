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
  final txtcontroller = TextEditingController();
  bool isLoading = true; // for indicator
  String siteName = 'www.daum.net';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
                      onPressed: () {
                        if (txtcontroller.text.trim().isNotEmpty) {
                          siteName = txtcontroller.text.trim();
                        }
                        _reloadSite();
                      },
                      icon: const Icon(Icons.next_plan_outlined))
        ],
        backgroundColor: Colors.teal,
        title: Center(
          child: Column(
            children: [
              SizedBox(
                width: 280,
                height: 70,
                child: TextField(
                  controller: txtcontroller,
                  autocorrect: false, // 자동완성 해제
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    labelText: 'Site 주소를 입력하세요.',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.amber),
                ),
              ),
              // const Text('WebView'),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     ElevatedButton(
              //         onPressed: () {
              //           setState(() {
              //             siteName =
              //                 'www.google.com'; // 단순하게 사이트 주소만 써주면 바뀌지 않는다! reloading 필요!
              //           });
              //           // 웹사이트는 한번 뜨면 연결이 끊어져 있기 때문에 다시 연결해주는 함수 만들어 쓴다
              //           _reloadSite();
              //         },
              //         style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStateProperty.all(Colors.red)),
              //         child: const Text('Google')),
              //     ElevatedButton(
              //         onPressed: () {
              //           setState(() {
              //             siteName =
              //                 'www.naver.com'; // 단순하게 사이트 주소만 써주면 바뀌지 않는다!
              //           });
              //           // 웹사이트는 한번 뜨면 연결이 끊어져 있기 때문에 다시 연결해주는 함수 만들어 쓴다
              //           _reloadSite();
              //         },
              //         style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStateProperty.all(Colors.green)),
              //         child: const Text('Naver')),
              //     ElevatedButton(
              //         onPressed: () {
              //           setState(() {
              //             siteName =
              //                 'www.daum.net'; // 단순하게 사이트 주소만 써주면 바뀌지 않는다!
              //           });
              //           // 웹사이트는 한번 뜨면 연결이 끊어져 있기 때문에 다시 연결해주는 함수 만들어 쓴다
              //           _reloadSite();
              //         },
              //         style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStateProperty.all(Colors.blue)),
              //         child: const Text('Daum')),
              //   ],
              // ),
            ],
          ),
        ),
        //toolbarHeight: 100,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.redAccent,
                  onPressed: () {
                    controller.data!.goBack();
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.amberAccent,
                    onPressed: () {
                      controller.data!.reload();
                    },
                    child: const Icon(Icons.replay),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.blueAccent,
                  onPressed: () {
                    controller.data!.goForward();
                  },
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
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
    //txtcontroller.text = '';
  } //

} //end
