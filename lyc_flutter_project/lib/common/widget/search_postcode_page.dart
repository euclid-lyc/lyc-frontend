import 'package:flutter/material.dart';
import 'package:daum_postcode_view/daum_postcode_view.dart';

class SearchPostcodePage extends StatelessWidget {

  const SearchPostcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DaumPostcodeView(
        onComplete: (model) {
          Navigator.of(context).pop(model);
        },
        options: const DaumPostcodeOptions(
          animation: true,
          hideEngBtn: true,
          themeType: DaumPostcodeThemeType.defaultTheme,
        ),
      ),
    );
  }
}
