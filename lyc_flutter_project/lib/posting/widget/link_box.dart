import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class LinkBox extends StatelessWidget {
  final String index;
  final String link;

  const LinkBox({super.key, required this.index, required this.link,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.only(right: 10),
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 9,
            child: Row(
              children: [
                Container(
                  width: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.deepGrey,
                  ),
                  child: Text(
                    '링크$index',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    link,
                    style: const TextStyle(
                      fontSize: 14.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: SvgPicture.asset(
                'assets/icon_eraser.svg',
                color: AppColor.deepGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
