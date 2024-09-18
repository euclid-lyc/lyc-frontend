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

  PushAlarmModel? _pushAlarmModel;
  bool _loadingPushAlarm = true;

  get member => _memberModel;

  get loadingMember => _loadingMember;

  get alarm => _pushAlarmModel;

  get loadingPushAlarm => _loadingPushAlarm;

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

  Future<void> getPushAlarm({bool refresh = false}) async {
    if (_loadingPushAlarm || !refresh) return;
    try {
      _loadingPushAlarm = true;
      final resp = await repositoryProvider.repository.getPushAlarms();
      _pushAlarmModel = resp.result;
      _loadingPushAlarm = false;
      notifyListeners();
    } catch (e) {
      Exception(e);
    }
  }

  void updatePushAlarm({
    bool dm = false,
    bool feed = false,
    bool schedule = false,
    bool likeMark = false,
    bool event = false,
    bool ad = false,
  }) async {
    if (dm) _pushAlarmModel = _pushAlarmModel!.copyWith(dm: dm);
    if (feed) _pushAlarmModel = _pushAlarmModel!.copyWith(feed: feed);
    if (schedule) _pushAlarmModel = _pushAlarmModel!.copyWith(schedule: schedule);
    if (likeMark) _pushAlarmModel = _pushAlarmModel!.copyWith(likeMark: likeMark);
    if (event) _pushAlarmModel = _pushAlarmModel!.copyWith(event: event);
    if (ad) _pushAlarmModel = _pushAlarmModel!.copyWith(ad: ad);
    notifyListeners();
  }

  Future<void> refreshAlarm() async {
    try {
      await getPushAlarm(refresh: true);
    } catch (e) {
      Exception(e);
    }
  }

  Future<void> savePushAlarm() async {
    try {
      await repositoryProvider.repository
          .updatePushAlarms(pushAlarmModel: _pushAlarmModel!);
    } catch (e) {
      Exception(e);
    }
  }
}
