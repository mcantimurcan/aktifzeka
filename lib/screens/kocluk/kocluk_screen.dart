import "package:flutter/material.dart";
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class KoclukScreen extends StatefulWidget {
  const KoclukScreen({super.key});
  @override
  State<KoclukScreen> createState() => _KoclukScreenState();
}

class _KoclukScreenState extends State<KoclukScreen> {
  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;
  late var url;
  var initialURL = "https://aktifzeka.com/hizmetler";
  double progress = 0;
  var urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              webViewController!.reload();
            },
            icon: Icon(Icons.refresh),
            color: Colors.blue,
          ),
          IconButton(
              onPressed: () async {
                if (await webViewController!.canGoBack()) {
                  webViewController!.goBack();
                }
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.blue, 
              )),
          IconButton(
            onPressed: () async {
              if (await webViewController!.canGoForward()) {
                webViewController!.goForward();
              }
            },
            icon: Icon(Icons.arrow_forward),
            color: Colors.blue, 
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              onWebViewCreated: (controller) => webViewController = controller,
              initialUrlRequest: URLRequest(url: WebUri(initialURL)),
            ),
          ),
        ],
      ),
    );
  }
}