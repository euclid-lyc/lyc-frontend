import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/widget/custom_back_button.dart';

/// 통일성을 위해 앞으로 appbar는 이걸 사용해주세요
/// 이 파일을 import하시고 사용하시면 됩니다
/// 사용 예]_뒤로가기 버튼 있고, 가운데 '안녕안녕', 휴지통 버튼은 없음
/// appBar: NormalAppbar(
//         backButton: true,
//         title: "안녕안녕",
//         deleteButton: false,
//       ),
/// 뒤로가기/휴지통 버튼은 true/false, title은 있으면 쓰고 없으면 ""(empty string)

class NormalAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool backButton;
  final String title;
  final bool deleteButton;

  const NormalAppbar({
    super.key,
    required this.backButton,
    required this.title,
    required this.deleteButton,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.beige,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: backButton ? Container(
                      alignment: AlignmentDirectional.bottomStart,
                      child: GestureDetector(
                        child: CustomBackButton(),
                        onTap: () => Navigator.pop(context),
                      ),
                    ) : SizedBox(),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: deleteButton ? Container(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: GestureDetector(
                        child: Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.white,
                        ),
                        onTap: () {
                          // delete
                        },
                      ),
                    ) : SizedBox(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90);
}