import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_now/time_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late WebViewController _webViewController;
  bool _isSearching = false;
  bool _isLoading = true;

  @override
  void initState() {
    _webViewController = WebViewController();
    super.initState();
  }

  void _search(String name) {
    setState(() {
      _isLoading = true;
    });
    _webViewController.loadRequest(Uri.parse('https://$name')).then((value) {});
    _webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    _webViewController.setNavigationDelegate(NavigationDelegate(
    onPageFinished: (_) => setState(() {
    _isLoading = false;
    })
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
           _search(value);
          },
          decoration: InputDecoration(
            hintText: "Search..."
          ),
        ) : const Text("WebView"),
        actions: [
          !_isSearching ?
          IconButton(onPressed: () {
            setState(() {
              _isSearching = true;
            });
          }, icon: Icon(CupertinoIcons.search)) : IconButton(onPressed: () {
            setState(() {
              _isSearching = false;
            });
          }, icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: _isLoading ? Center(
        child: CircularProgressIndicator() ) : WebViewWidget(
        controller: _webViewController,
      )
    );
  }
}
