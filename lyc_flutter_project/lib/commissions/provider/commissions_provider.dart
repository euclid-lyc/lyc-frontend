import 'package:flutter/cupertino.dart';
import 'package:lyc_flutter_project/commissions/model/basic_info.dart';
import 'package:lyc_flutter_project/commissions/model/desired_style.dart';
import '../model/other_matters.dart';
import '../repository/commissions_repository.dart';

class CommissionsProvider with ChangeNotifier {
  final CommissionsRepository repository;

  bool _isLoading = false;
  String _directerId = '';
  BasicInfo _basicInfo = BasicInfo.defaultValue();
  DesiredStyle _desiredStyle = DesiredStyle.defaultValue();
  OtherMatters _otherMatters = OtherMatters.defaultValue();

  CommissionsProvider({required this.repository});

  bool get isLoading => _isLoading;

  String get directerId => _directerId;

  BasicInfo get basicInfo => _basicInfo;

  DesiredStyle get desiredStyle => _desiredStyle;

  OtherMatters get otherMatters => _otherMatters;

  set directerId(String value) {
    _directerId = value;
    notifyListeners();
  }

  set basicInfo(BasicInfo value) {
    _basicInfo = value;
    notifyListeners();
  }

  set desiredStyle(DesiredStyle value) {
    _desiredStyle = value;
    notifyListeners();
  }

  set otherMatters(OtherMatters value) {
    _otherMatters = value;
    notifyListeners();
  }

  // submitComission 메서드 수정
  Future<void> submitCommission({
    required String directerId,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      await repository.submitCommission(
        directerId: directerId,
        basicInfo: basicInfo,
        desiredStyle : desiredStyle,
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
