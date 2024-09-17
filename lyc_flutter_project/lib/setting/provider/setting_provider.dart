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

  String? _oldPassword;
  String? _newPassword;
  String? _confirmPassword;

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
  }

  void updateNickname(String newNickname) {
    _memberModel = _memberModel!.copyWith(nickname: newNickname);
  }

  void updateLoginId(String newLoginId) {
    _memberModel = _memberModel!.copyWith(loginId: newLoginId);
  }

  void updateIntroduction(String newIntroduction) {
    _memberModel = _memberModel!.copyWith(introduction: newIntroduction);
  }

  bool canSaveMemberInfo() {
    return true;
  }

  Future<void> saveMemberInfo() async {
    if (canSaveMemberInfo()) {
      await repositoryProvider.repository.updateMemberInfo(
        memberModel: _memberModel!,
      );
    }
  }

  void setOldPassword(String pw) {
    _oldPassword = pw;
  }

  void setNewPassword(String pw) {
    _newPassword = pw;
  }

  void setConfirmPassword(String pw) {
    _confirmPassword = pw;
  }

  Future<void> saveNewPassword() async {
    if (_oldPassword == null ||
        _newPassword == null ||
        _confirmPassword == null) return;
    try {
      PasswordModel model = PasswordModel(
        oldPassword: _oldPassword!,
        newPassword: _newPassword!,
        confirmPassword: _confirmPassword!,
      );
      await repositoryProvider.repository.updatePassword(
        passwordModel: model,
      );
    } catch (e) {
      Exception(e);
    }
  }
}
