import 'package:flutter/material.dart';

class BlockedWidget extends StatelessWidget {
  const BlockedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(1, 0, 0, 228),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 1, 19.5),
            child: const Text(
              '차단된 유저입니다',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                height: 1.3,
                color: Color(0xFF898989),
              ),
            ),
          ),
          SizedBox(
            width: 263,
            height: 40,
            child: TextButton(
              onPressed: () {
                // 클릭 이벤트 처리 로직 추가
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFEFFC3),
                padding: const EdgeInsets.symmetric(vertical: 9.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                '차단 계정 관리 >',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
