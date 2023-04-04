import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({Key? key}) : super(key: key);

  @override

  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('My WebView'),
      ),
      body: WebView(
        initialUrl: 'https://uatexam.testsdib.in',
        javascriptMode: JavascriptMode.unrestricted,

      ),
    );
  }
}

