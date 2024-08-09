import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/setting/widget/logout_button.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 40.0,
        vertical: 30.0,
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "로그아웃하시겠습니까",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: LogoutButton(
                    label: "아니오",
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Expanded(
                  flex: 3,
                  child: LogoutButton(
                    label: "네",
                    onPressed: tmp,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void tmp() {}