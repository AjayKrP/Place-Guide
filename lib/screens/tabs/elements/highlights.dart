import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Highlights extends StatelessWidget {
  String highlight;
  Highlights(this.highlight);
  var md_style = MarkdownStyleSheet(
    textAlign: WrapAlignment.start,
    h1Align: WrapAlignment.start,
  );


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Align(
            child: Text(
              'Highlights',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
        MarkdownBody(
          data: this.highlight,
        ),
      ],
    );
  }
}
