// import 'package:flutter/material.dart';
// import 'package:lyc_flutter_project/data/app_color.dart';
// import 'package:lyc_flutter_project/mypage/provider/block_provider.dart';
// import 'package:lyc_flutter_project/styles/app_text_style.dart';
// import 'package:provider/provider.dart';
//
// class BlockDialog extends StatelessWidget {
//   final int memberId;
//   final BlockProvider blockProvider;
//
//   const BlockDialog({
//     super.key,
//     required this.blockProvider,
//     required this.memberId,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     BlockProvider blockProvider = Provider.of<BlockProvider>(context);
//
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       child: Stack(
//         children: [
//           Center(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               width: 252,
//               height: 179,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.fromLTRB(0, 0, 0, 31),
//                     child: Text(
//                       blockProvider.isBlocked(memberId)
//                           ? '차단을 해제하시겠습니까?'
//                           : '차단하시겠습니까?',
//                       style: app_text_style.littleTitle,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 176,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.fromLTRB(0, 0, 26, 0),
//                           decoration: BoxDecoration(
//                             color: AppColor.grey,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColor.grey,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               padding:
//                                   const EdgeInsets.fromLTRB(0, 5.5, 0, 4.5),
//                               minimumSize: const Size(75, 36),
//                             ),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: const Text(
//                               '취소',
//                               style: app_text_style.labelTextStyle,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.black,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               padding: const EdgeInsets.fromLTRB(
//                                 0,
//                                 5.5,
//                                 0,
//                                 4.5,
//                               ),
//                               minimumSize: const Size(75, 36),
//                             ),
//                             onPressed: () {
//                               blockProvider.toggleBlock(memberId);
//                               Navigator.of(context).pop(); // 다이얼로그 닫기
//                             },
//                             child: Text(
//                               blockProvider.isBlocked(memberId) ? '차단 해제' : '차단',
//                               style: app_text_style.button,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
