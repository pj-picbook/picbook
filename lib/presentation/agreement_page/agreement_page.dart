import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AgreementPage extends StatelessWidget {
  final String title;
  final String url;
  AgreementPage({required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: WebView(
          initialUrl: url,
        ));
  }
}
