import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';

/// 좀 더 일반화되게 + 간단하게 사용할 수 있게 수정합니다
/// backButton은 default가 true입니다 -> false인 경우에만 명시하면 됩니다
/// title은 default가 ""입니다 -> 있는 경우 써주면 됩니다
/// backgroundColor는 default가 AppColor.beige입니다
/// 휴지통과 같이 맨 오른쪽 아이콘을 사용하는 경우 아이콘과 onTap method를 함께 전달합니다

class NormalAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool backButton;
  final String title;
  final Widget? icon;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const NormalAppbar({
    super.key,
    this.backButton = true,
    this.title = "",
    this.icon,
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColor.beige,
      automaticallyImplyLeading: false,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: backButton
                      ? Container(
                          alignment: AlignmentDirectional.bottomStart,
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                            ),
                            onTap: () => Navigator.pop(context),
                          ),
                        )
                      : const SizedBox(),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: (icon != null)
                      ? Container(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: GestureDetector(
                            onTap: onTap,
                            child: icon,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
