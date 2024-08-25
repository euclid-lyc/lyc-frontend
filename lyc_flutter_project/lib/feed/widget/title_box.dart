import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class TitleBox extends StatelessWidget {
  final String title;
  final String detail;
  final Widget? right;

  const TitleBox({
    super.key,
    required this.title,
    required this.detail,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff525252),
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                  ),
                ),
                Text(
                  detail,
                  style: const TextStyle(
                    color: AppColor.deepGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            right ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
