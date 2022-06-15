import 'dart:developer';

import 'package:eat_meat/pages/qr_scan.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

enum WebMenuOptions {
  clearCache,
  clearCookies,
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _webController;
  double progress = 0;

  void _onClearCookies(BuildContext context) async {
    final bool hadCookies = await CookieManager().clearCookies();
    String message = 'Cookies have been cleared';
    if (!hadCookies) {
      message = 'Cookies are already cleared';
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _onClearCache(
    WebViewController controller,
    BuildContext context,
  ) async {
    await controller.clearCache();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cache has been cleared')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _webController.canGoBack()) {
          _webController.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () async {
                if (await _webController.canGoBack()) {
                  _webController.goBack();
                } else {
                  log('Unable to go back');
                }
                return;
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () async {
                if (await _webController.canGoForward()) {
                  _webController.goForward();
                } else {
                  log('Unable to go forward');
                }
                return;
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: () => _webController.reload(),
            ),
            PopupMenuButton<WebMenuOptions>(
              onSelected: (value) {
                switch (value) {
                  case WebMenuOptions.clearCache:
                    _onClearCache(_webController, context);
                    break;
                  case WebMenuOptions.clearCookies:
                    _onClearCookies(context);
                    break;
                }
              },
              itemBuilder: (context) => <PopupMenuItem<WebMenuOptions>>[
                const PopupMenuItem(
                  value: WebMenuOptions.clearCache,
                  child: Text('Clear cache'),
                ),
                const PopupMenuItem(
                  value: WebMenuOptions.clearCookies,
                  child: Text('Clear cookies'),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              color: Colors.red,
              backgroundColor: Colors.black,
            ),
            Expanded(
              child: WebView(
                // initialUrl: 'https://flutter.dev',
                initialUrl: 'https://youtube.com',
                // initialUrl: 'http://info.cern.ch',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  _webController = controller;
                },
                onProgress: (progress) {
                  this.progress = progress / 100;
                  setState(() {});
                },
                onPageStarted: (url) {
                  log('started URL $url');
                },
                onPageFinished: (url) {
                  log('finished URL $url');
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.qr_code_scanner),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QrScan(),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
