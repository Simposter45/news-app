import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageScreen extends StatefulWidget {
  final String url;
  WebPageScreen({
    super.key,
    required this.url,
  });

  @override
  State<WebPageScreen> createState() => _WebPageScreenState();
}

class _WebPageScreenState extends State<WebPageScreen> {
  WebViewController? webViewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webViewController = WebViewController()
      ..loadRequest(
        Uri.parse(widget.url),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: WebViewWidget(
        controller: webViewController!,
        key: widget.key,
      ),
    );
  }
}
