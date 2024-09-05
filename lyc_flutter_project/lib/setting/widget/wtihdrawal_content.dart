import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/setting/style/text_style.dart';

class WithdrawalContent extends StatelessWidget {
  final String title;
  final String content;

  const WithdrawalContent({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TITLE_STYLE,
        ),
        const SizedBox(height: 4.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "•  ",
              style: CONTENT_STYLE,
            ),
            Expanded(
              child: Text(content, style: CONTENT_STYLE),
            ),
          ],
        ),
      ],
    );
  }
}
