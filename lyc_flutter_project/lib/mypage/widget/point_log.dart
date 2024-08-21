import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class PointLog extends StatelessWidget {
  const PointLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '7/4',
                    style: TextStyle(
                      color: AppColor.deepGrey,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Winter',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '의상 구매 및 디렉팅',
                        style: TextStyle(
                          color: AppColor.brown,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              '-105,500',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
