import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/commissions/model/basic_info.dart';
import '../model/other_matters.dart';
import '../repository/commissions_repository.dart';

class CommissionsProvider with ChangeNotifier {
  final CommissionsRepository repository;

  bool _isLoading = false;
  String _directerId = '';
  BasicInfo _basicInfo = BasicInfo.defaultValue();
  OtherMatters _otherMatters = OtherMatters.defaultValue();

  CommissionsProvider({required this.repository});

  bool get isLoading => _isLoading;

  String get directerId => _directerId;

  BasicInfo get basicInfo => _basicInfo;

  OtherMatters get otherMatters => _otherMatters;

  set directerId(String value) {
    _directerId = value;
    notifyListeners();
  }

  set basicInfo(BasicInfo value) {
    _basicInfo = value;
    notifyListeners();
  }

  set otherMatters(OtherMatters value) {
    _otherMatters = value;
    notifyListeners();
  }

  // submitComission 메서드 수정
  Future<void> submitCommission({
    required String directerId,
    required BasicInfo basicInfo,
    required OtherMatters otherMatters,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      // 직접 받은 파라미터를 사용하여 Repository 메서드 호출
      await repository.submitCommission(
        directerId: directerId,
        basicInfo: basicInfo,
        otherMatters: otherMatters,
      );
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
