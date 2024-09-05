// import 'package:flutter/material.dart';
// import 'package:lyc_flutter_project/data/app_color.dart';
//

/// 같은 이름의 깔쌈한 기본 제공 버튼이 있어서
/// 요놈은 폐기함ㅎㅎ..

// class CloseButton extends StatelessWidget {
//   const CloseButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       style: ButtonStyle(
//         foregroundColor: MaterialStateProperty.all(
//           Colors.black.withOpacity(0.6),
//         ),
//         backgroundColor: MaterialStateProperty.resolveWith(
//               (states) {
//             if (states.contains(MaterialState.pressed)) {
//               return AppColor.grey;
//             } else {
//               return Colors.transparent;
//             }
//           },
//         ),
//         textStyle: MaterialStateProperty.all(
//           const TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 20.0,
//           ),
//         ),
//       ),
//       child: const Text("닫기"),
//     );
//   }
// }