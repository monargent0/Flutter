import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web extends StatefulWidget {
  final String siteName;
  const Web({Key? key , required this.siteName}) : super(key: key);

  @override
  State<Web> createState() => _WebState();
}

class _WebState extends State<Web> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  // late String siteName;
  
  @override
  void initState() {
    super.initState();
    // siteName = WareHouse.sitename;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            initialUrl: 'http://${widget.siteName}',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController){
              _controller.complete(webViewController);
            },

            onPageFinished: (finish){
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (start){
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading ? const Center(
            child: CircularProgressIndicator(),
          ) : Stack(),
        ],
        ),
        floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              backgroundColor: Colors.redAccent,
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
}