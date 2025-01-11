import 'package:flutter/cupertino.dart';


import '../repository/commissions_repository.dart';

class CommissionsProvider with ChangeNotifier {
  final CommissionsRepositoryProvider repositoryProvider;
  CommissionsProvider({required this.repositoryProvider});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> terminateCommission(int chatId) async {
    _isLoading = true;
    notifyListeners();
    try {
      final resp = await repositoryProvider.commissionsRepository
          .terminateCommission(chatId: chatId);
      if (!resp.isSuccess) throw Exception(resp.message);
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void>updateCommission(int commissionId)async{
    _isLoading = true;
    notifyListeners();
    try {
      final resp = await repositoryProvider.commissionsRepository
          .updateCommission(commissionId: commissionId);
      if (!resp.isSuccess) throw Exception(resp.message);
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

// String _directerId = '';
// BasicInfo _basicInfo = BasicInfo.defaultValue();
// DesiredStyle _desiredStyle = DesiredStyle.defaultValue();
// OtherMatters _otherMatters = OtherMatters.defaultValue();
//
// CommissionsProvider({required this.repository});
//
//
// String get directerId => _directerId;
//
// BasicInfo get basicInfo => _basicInfo;
//
// DesiredStyle get desiredStyle => _desiredStyle;
//
// OtherMatters get otherMatters => _otherMatters;
//
// set directerId(String value) {
//   _directerId = value;
//   notifyListeners();
// }
//
// set basicInfo(BasicInfo value) {
//   _basicInfo = value;
//   notifyListeners();
// }
//
// set desiredStyle(DesiredStyle value) {
//   _desiredStyle = value;
//   notifyListeners();
// }
//
// set otherMatters(OtherMatters value) {
//   _otherMatters = value;
//   notifyListeners();
// }
//
// // submitComission 메서드 수정
// Future<void> submitCommission({
//   required String directerId,
//   required BuildContext context,
// }) async {
//   _isLoading = true;
//   notifyListeners();
//   try {
//     await repository.submitCommission(
//       directerId: directerId,
//       basicInfo: basicInfo,
//       desiredStyle : desiredStyle,
//       otherMatters: otherMatters,
//       context: context,
//     );
//   } catch (e) {
//     print(e);
//   } finally {
//     _isLoading = false;
//     notifyListeners();
//   }
// }
