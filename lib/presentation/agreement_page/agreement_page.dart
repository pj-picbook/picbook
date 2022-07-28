import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AgreementPage extends StatefulWidget {
  final String title;
  final String url;
  AgreementPage({required this.title, required this.url});

  @override
  State<AgreementPage> createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: WebView(
          initialUrl: widget.url,
        ));
  }
}
