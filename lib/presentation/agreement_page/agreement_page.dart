import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AgreementPage extends StatefulWidget {
  const AgreementPage({Key? key, required this.title, required this.url})
      : super(key: key);
  final String title;
  final String url;

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
