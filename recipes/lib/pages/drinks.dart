import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Drinks extends StatelessWidget {
  const Drinks({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https:/www.arecibo.inter.edu',
    );
  }
}
