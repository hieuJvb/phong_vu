import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewPage extends StatelessWidget {
  final String url;

  const InAppWebViewPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web View"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(url)),
      ),
    );
  }
}