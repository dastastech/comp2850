import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Desserts extends StatelessWidget {
  const Desserts({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https://www.endi.com',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
