import 'package:flutter/material.dart';
import 'package:lyc_flutter_project/common/widget/home_appbar.dart';
import 'package:lyc_flutter_project/common/widget/member_list.dart';
import 'package:lyc_flutter_project/common/widget/switch_category_button.dart';
import 'package:lyc_flutter_project/data/app_color.dart';
import 'package:lyc_flutter_project/director/widget/custom_search_bar.dart';
import 'package:lyc_flutter_project/styles/default_padding.dart';

class DirectorSearchScreen extends StatefulWidget {
  const DirectorSearchScreen({super.key});

  @override
  State<DirectorSearchScreen> createState() => _DirectorSearchScreenState();
}

class _DirectorSearchScreenState extends State<DirectorSearchScreen> {
  bool isNormal = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.lightGrey,
      appBar: const HomeAppbar(),
      body: DefaultPadding(
        bottom: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              onChanged: (String value) {},
            ),
            const SizedBox(height: 16.0),
            renderButtons(),
            const SizedBox(height: 16.0),
            const _PaddingText(
              label: "디렉터 랭킹",
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
            const _PaddingText(
              label: "사용자의 취향에 맞는 코디를 추천드려요",
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const MemberList(
                    profile: "assets/ex_profile.png",
                    nickname: "karina",
                    id: "katarinabluu",
                    // button: ActiveState(),
                  );
                },
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container renderButtons() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height / 22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SwitchCategoryButton(
            text: "일반검색",
            isSelected: isNormal,
            onPressed: () =>
                setState(() {
                  isNormal = true;
                }),
            color: AppColor.brown,
          ),
          SwitchCategoryButton(
            text: "키워드검색",
            isSelected: !isNormal,
            onPressed: () =>
                setState(() {
                  isNormal = false;
                }),
            color: AppColor.brown,
          ),
        ],
      ),
    );
  }
}

class _PaddingText extends StatelessWidget {
  final String label;
  final FontWeight fontWeight;
  final double fontSize;

  const _PaddingText({
    super.key,
    required this.label,
    required this.fontWeight,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
