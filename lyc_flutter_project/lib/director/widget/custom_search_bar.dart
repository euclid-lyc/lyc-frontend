import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const CustomSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onChanged: onChanged,
      backgroundColor: MaterialStateProperty.all(Colors.white),
      hintText: "검색어를 입력하세요",
      hintStyle: MaterialStateProperty.all(
        const TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      elevation: MaterialStateProperty.all(3.0),
      trailing: [
        IconButton(
          onPressed: () {

          },
          icon: SvgPicture.asset(
            "assets/icon/search.svg",
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
