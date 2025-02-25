import 'package:flutter/cupertino.dart';

import '../../data/app_color.dart';
import '../../mypage/widget/select_buttons_in_posting.dart';

class ButtonList extends StatelessWidget {
  final List<String> name;
  final List<String> selected;
  final Function(String) onSelected;
  final bool? enabled;

  const ButtonList(
      {super.key,
      required this.name,
      required this.selected,
      required this.onSelected,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (var i = 0; i < 4; i++)
              Expanded(
                child: SelectButtonsInPosting(
                  name,
                  selected,
                  i,
                  () => onSelected(name[i]),
                  AppColor.brown,
                  AppColor.lightGrey,
                  enabled??true,
                ),
              ),
          ],
        ),
        Row(
          children: [
            for (var i = 4; i < 8; i++)
              Expanded(
                child: SelectButtonsInPosting(
                  name,
                  selected,
                  i,
                  () => onSelected(name[i]),
                  AppColor.brown,
                  AppColor.lightGrey,
                  enabled??true,
                ),
              ),
          ],
        )
      ],
    );
  }
}
