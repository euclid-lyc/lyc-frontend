import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';

class MypageLayout extends StatelessWidget {
  final Widget top;
  final Widget body;

  const MypageLayout({
    super.key,
    required this.top,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.beige,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: top,
          ),
          Expanded(
            flex: 3,
            child: DefaultPadding(
              bottom: 20.0,
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
