import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlShortD extends StatelessWidget {
  final String shortDescription;
  const HtmlShortD({super.key, required this.shortDescription});

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(shortDescription);
  }
}
