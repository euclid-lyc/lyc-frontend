import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/setting/model/member_model.dart';
import 'package:lyc_flutter_project/setting/repository/setting_repository.dart';

class SettingProvider extends ChangeNotifier {
  final SettingRepositoryProvider repositoryProvider;

  SettingProvider({
    required this.repositoryProvider,
  });

  MemberModel? _memberModel;
  bool _loadingMember = true;

  get member => _memberModel;

  get loadingMember => _loadingMember;

  Future<void> getProfile({
    bool refresh = false,
  }) async {
    if (_memberModel == null || refresh) {
      _loadingMember = true;
      final resp = await repositoryProvider.repository.getMemberInfo();
      _memberModel = resp.result;
      _loadingMember = false;
      notifyListeners();
    }
  }

  void updateProfileImage(XFile newImage) {
    _memberModel =
        _memberModel!.copyWith(profileImage: newImage.path.toString());
    print("update image : ${_memberModel!.profileImage}");
  }

  void updateNickname(String newNickname) {
    _memberModel = _memberModel!.copyWith(nickname: newNickname);
    print("new nick: ${_memberModel!.nickname}");
    notifyListeners();
  }

  void updateLoginId(String newLoginId) {
    _memberModel = _memberModel!.copyWith(loginId: newLoginId);
    print("new id: ${_memberModel!.loginId}");

  }

  void updateIntroduction(String newIntroduction) {
    _memberModel = _memberModel!.copyWith(introduction: newIntroduction);
    print("new intro: ${_memberModel!.introduction}");

  }

  bool canSaveMemberInfo() {
    return true;
  }

  void saveMemberInfo() {
    if (canSaveMemberInfo()) {
      repositoryProvider.repository.updateMemberInfo(
        memberModel: _memberModel!,
      );
    }
  }
}
