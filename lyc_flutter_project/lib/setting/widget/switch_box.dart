import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

class SwitchBox extends StatelessWidget {
  final String label;
  final String? note;
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const SwitchBox({
    super.key,
    required this.label,
    required this.onChanged,
    required this.isChecked,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.only(left: 16.0, right: 10.0),
      height: 60.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0),
              ),
              if (note != null)
                Text(
                  note!,
                  style: const TextStyle(
                    color: AppColor.deepGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.0,
                  ),
                ),
            ],
          ),
          CupertinoSwitch(
            value: isChecked,
            onChanged: onChanged,
            activeColor: const Color(0xff03A600),
          )
        ],
      ),
    );
  }
}