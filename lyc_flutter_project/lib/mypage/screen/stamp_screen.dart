import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/mypage/widget/stamp.dart';

class StampScreen extends StatelessWidget {
  const StampScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.lightGrey,
      contentPadding: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 10.0,
      shadowColor: Colors.black,
      actionsAlignment: MainAxisAlignment.end,
      content: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 14.0,
        ),
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 2,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            if (index < 4) {
              return const Stamp(
                isSelected: true,
              );
            } else {
              return const Stamp();
            }
          },
        ),
      ),
      actions: const [
        CloseButton(),
      ],
    );
  }
}
