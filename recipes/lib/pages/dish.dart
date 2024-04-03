import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Dish extends StatelessWidget {
  const Dish({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https:/www.google.com',
    );
  }
}
