import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class StampScreen extends StatelessWidget {
  const StampScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.deepGrey,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("확인"),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(AppColor.lightGrey.withOpacity(0.7)),
            foregroundColor:
                MaterialStateProperty.all(Colors.black.withOpacity(0.6)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Stamp extends StatelessWidget {
  const Stamp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      height: 40,
      // height: MediaQuery.of(context).size.width / 9,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.lightGrey,
      ),
    );
  }
}
