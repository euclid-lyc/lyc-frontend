import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lyc_flutter_project/common/model/api_response.dart';
import 'package:lyc_flutter_project/setting/database/alarm_db.dart';
import 'package:lyc_flutter_project/setting/model/block_member.dart';
import 'package:lyc_flutter_project/setting/model/member_model.dart';
import 'package:lyc_flutter_project/setting/model/style_model.dart';
import 'package:lyc_flutter_project/setting/repository/setting_repository.dart';

class SettingProvider extends ChangeNotifier {
  final SettingRepositoryProvider repositoryProvider;

  SettingProvider({
    required this.repositoryProvider,
  });

  /// 회원 정보 변경 ///

  MemberModel? _memberModel;
  bool _loadingMember = true;

  String? _oldPassword;
  String? _newPassword;
  String? _confirmPassword;

  get member => _memberModel;

  get loadingMember => _loadingMember;

  get newPassword => _newPassword;

  Future<void> getProfile({
    bool refresh = false,
  }) async {
    try {
      if (_memberModel == null || refresh) {
        _loadingMember = true;
        notifyListeners();
        final resp = await repositoryProvider.repository.getMemberInfo();
        _memberModel = resp.result;
        _loadingMember = false;
        notifyListeners();
      }
    } catch (e) {
      _loadingPushAlarm = false;
      notifyListeners();
      throw Exception(e);
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
    return (_memberModel != null &&
        !(_memberModel!.nickname.length < 2) &&
        !(_memberModel!.nickname.length < 10) &&
        !(_memberModel!.loginId.length > 6) &&
        !(_memberModel!.loginId.length < 30));
  }

  Future<void> saveMemberInfo() async {
    if (canSaveMemberInfo()) {
      final infoDTO = jsonEncode({
        "nickname": _memberModel!.nickname,
        "introduction": _memberModel!.introduction,
        "loginId": _memberModel!.loginId,
      });
      final image = File(_memberModel!.profileImage);
      repositoryProvider.repository.updateMemberInfo(
        infoDTO: infoDTO,
        image: image,
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

  Future<bool> checkOldPassword(String? pw) async {
    if (pw == null || pw.isEmpty) return false;
    try {
      PasswordModel tempModel =
          PasswordModel(oldPassword: pw, newPassword: "", confirmPassword: " ");
      await repositoryProvider.repository
          .updatePassword(passwordModel: tempModel);
      return false;
    } on DioException catch (e) {
      if (e.response?.data["code"] == "MEMBER4013") {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> saveNewPassword() async {
    if (_oldPassword == null ||
        _newPassword == null ||
        _confirmPassword == null) {
      return false;
    }
    try {
      PasswordModel model = PasswordModel(
        oldPassword: _oldPassword!,
        newPassword: _newPassword!,
        confirmPassword: _confirmPassword!,
      );
      await repositoryProvider.repository.updatePassword(
        passwordModel: model,
      );
      return true;
    } on DioException catch (e) {
      if (e.response?.data["code"] == "MEMBER2014") {
        return true;
      } else {
        return false;
      }
    }
  }

  /// 회원 정보 변경

  /// -------------------------------------------------------

  /// 푸시 알림 설정
  PushAlarmModel? _pushAlarmModel;
  bool _loadingPushAlarm = false;

  PushAlarmModel get alarm => _pushAlarmModel!;

  get loadingPushAlarm => _loadingPushAlarm;

  void initAlarmScreen() {
    initDb();
    initModel();
  }

  Future<void> initDb() async {
    if (_pushAlarmModel != null) return;

    _loadingPushAlarm = true;
    notifyListeners();

    await initializeAlarmDb();

    _loadingPushAlarm = false;
    notifyListeners();
  }

  Future<void> initModel({bool refresh = false}) async {
    if (_pushAlarmModel != null && !refresh) return;

    _loadingPushAlarm = true;
    notifyListeners();

    final bool dm = await getAlarm(PushAlarm.dm);
    final bool feed = await getAlarm(PushAlarm.feed);
    final bool schedule = await getAlarm(PushAlarm.calendar);
    final bool likeMark = await getAlarm(PushAlarm.like);
    final bool event = await getAlarm(PushAlarm.event);
    final bool ad = await getAlarm(PushAlarm.ad);

    _pushAlarmModel = PushAlarmModel(
      dm: dm,
      feed: feed,
      schedule: schedule,
      likeMark: likeMark,
      event: event,
      ad: ad,
    );

    _loadingPushAlarm = false;
    notifyListeners();
  }

  void updateDm(bool selected) {
    _pushAlarmModel = _pushAlarmModel!.copyWith(dm: selected);
    notifyListeners();
  }

  void updateFeed(bool selected) {
    _pushAlarmModel = _pushAlarmModel!.copyWith(feed: selected);
    notifyListeners();
  }

  void updateSchedule(bool selected) {
    _pushAlarmModel = _pushAlarmModel!.copyWith(schedule: selected);
    notifyListeners();
  }

  void updateLikeMark(bool selected) {
    _pushAlarmModel = _pushAlarmModel!.copyWith(likeMark: selected);
    notifyListeners();
  }

  void updateEvent(bool selected) {
    _pushAlarmModel = _pushAlarmModel!.copyWith(event: selected);
    notifyListeners();
  }

  void updateAd(bool selected) {
    _pushAlarmModel = _pushAlarmModel!.copyWith(ad: selected);
    notifyListeners();
  }

  Future<void> saveAlarm() async {
    await setAlarm(PushAlarm.dm, _pushAlarmModel!.dm);
    await setAlarm(PushAlarm.feed, _pushAlarmModel!.feed);
    await setAlarm(PushAlarm.calendar, _pushAlarmModel!.schedule);
    await setAlarm(PushAlarm.like, _pushAlarmModel!.likeMark);
    await setAlarm(PushAlarm.event, _pushAlarmModel!.event);
    await setAlarm(PushAlarm.ad, _pushAlarmModel!.ad);
  }

  /// 푸시 알림 설정

  /// -------------------------------------------------------

  /// 차단 계정 관리

  List<BlockMember> _blockMembers = [];
  bool _loadingBlockMembers = false;
  bool _hasMoreBlockMembers = true;

  get blockMembers => _blockMembers;

  get loadingBlockMembers => _loadingBlockMembers;

  Future<void> refreshBlockMembers() async {
    await getBlockMembers(refresh: true);
    notifyListeners();
  }

  Future<void> getBlockMembers({
    bool refresh = false,
    int pageSize = 10,
    int? blockMemberId,
  }) async {
    if (_loadingBlockMembers || (!refresh && !_hasMoreBlockMembers)) return;

    if (!refresh & _blockMembers.isNotEmpty) {
      blockMemberId = _blockMembers.last.memberId;
    }

    try {
      _loadingBlockMembers = true;
      notifyListeners();
      final resp = await repositoryProvider.repository.getBlockMembers(
        pageSize: pageSize,
        blockMemberId: blockMemberId,
      );
      final list = resp.result.members;
      _blockMembers = refresh
          ? [...list]
          : [
              ..._blockMembers,
              ...list,
            ];
      _hasMoreBlockMembers = list.length >= pageSize;
    } catch (e) {
      if (e is ApiResponse) {
        print("error in getRanking: ${e.message}");
      } else {
        print("error in getRanking");
      }
    } finally {
      _loadingBlockMembers = false;
      notifyListeners();
    }
  }

  Future<void> blockMember({required int memberId}) async {
    try {
      await repositoryProvider.repository.blockMember(memberId: memberId);
      await getBlockMembers(refresh: true);
    } catch (e) {
      if (e is ApiResponse) {
        Exception(e.message);
      } else {
        Exception(e);
      }
    }
  }

  Future<void> unblockMember({required int memberId}) async {
    try {
      await repositoryProvider.repository.unblockMember(memberId: memberId);
      await getBlockMembers(refresh: true);
      notifyListeners();
    } catch (e) {
      if (e is ApiResponse) {
        Exception(e.message);
      } else {
        Exception(e);
      }
    }
  }

  /// 차단 계정 관리

  /// -------------------------------------------------------

  /// 스타일 정보 변경

  bool _loadingStyeInfo = false;
  StyleModel? _styleInfo;

  int? _topSize;
  int? _bottomSize;

  get loadingStyleInfo => _loadingStyeInfo;

  get topSize => _topSize;

  get bottomSize => _bottomSize;

  StyleModel get style => _styleInfo!;

  Future<void> updateStyleInfo() async {
    try {
      final styleModel = PatchStyleModel(
        isPublic: true,
        height: _styleInfo!.spec.height,
        weight: _styleInfo!.spec.weight,
        topSize: "SIZE_$_topSize",
        bottomSize: "SIZE_$_bottomSize",
        preferredStyleList: _styleInfo!.preferredStyle.styles,
        nonPreferredStyleList: _styleInfo!.nonPreferredStyle.styles,
        preferredMaterialList: _styleInfo!.preferredMaterials.materials,
        nonPreferredMaterialList: _styleInfo!.nonPreferredMaterials.materials,
        preferredFitList: _styleInfo!.preferredFits.fits,
        nonPreferredFitList: _styleInfo!.nonPreferredFits.fits,
        goodBodyTypeList: _styleInfo!.goodBodyTypes.bodyTypes,
        badBodyTypeList: _styleInfo!.badBodyTypes.bodyTypes,
        details: _styleInfo!.details,
      );
      await repositoryProvider.repository
          .updateStyleInfo(styleModel: styleModel);
    } catch (e) {
      if (e is ApiResponse) {
        Exception(e.message);
      } else {
        Exception(e);
      }
    }
  }

  void updateHeight({required String selected}) {
    _styleInfo = _styleInfo!.copyWith(
      spec: SpecModel(
        height: int.parse(selected),
        weight: _styleInfo!.spec.weight,
        topSize: _styleInfo!.spec.topSize,
        bottomSize: _styleInfo!.spec.bottomSize,
      ),
    );
    notifyListeners();
  }

  void updateWeight({required String selected}) {
    _styleInfo = _styleInfo!.copyWith(
      spec: SpecModel(
        height: _styleInfo!.spec.height,
        weight: int.parse(selected),
        topSize: _styleInfo!.spec.topSize,
        bottomSize: _styleInfo!.spec.bottomSize,
      ),
    );
    notifyListeners();
  }

  void updateDetails({required String text}) {
    _styleInfo = _styleInfo!.copyWith(details: text);
    notifyListeners();
  }

  void updateTopSize({required int selected}) {
    _topSize = selected;
    notifyListeners();
  }

  void updateBottomSize({required int selected}) {
    _bottomSize = selected;
    notifyListeners();
  }

  void rollbackTopSize() {
    _topSize = int.parse(_styleInfo!.spec.topSize.substring(5));
    notifyListeners();
  }

  void rollbackBottomSize() {
    _bottomSize = int.parse(_styleInfo!.spec.bottomSize.substring(5));
    notifyListeners();
  }

  void updatePreferredStyle({required String selected}) {
    List<String> list = _styleInfo!.preferredStyle.styles;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _styleInfo =
        _styleInfo!.copyWith(preferredStyle: StyleListModel(styles: list));
    notifyListeners();
  }

  void updateNonPreferredStyle({required String selected}) {
    List<String> list = _styleInfo!.nonPreferredStyle.styles;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _styleInfo =
        _styleInfo!.copyWith(nonPreferredStyle: StyleListModel(styles: list));
    notifyListeners();
  }

  void updatePreferredMaterials({required String selected}) {
    List<String> list = _styleInfo!.preferredMaterials.materials;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _styleInfo = _styleInfo!
        .copyWith(preferredMaterials: MaterialModel(materials: list));
    notifyListeners();
  }

  void updateNonPreferredMaterials({required String selected}) {
    List<String> list = _styleInfo!.nonPreferredMaterials.materials;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _styleInfo = _styleInfo!
        .copyWith(nonPreferredMaterials: MaterialModel(materials: list));
    notifyListeners();
  }

  void updatePreferredFits({required String selected}) {
    List<String> list = _styleInfo!.preferredFits.fits;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _styleInfo = _styleInfo!.copyWith(preferredFits: FitModel(fits: list));
    notifyListeners();
  }

  void updateNonPreferredFits({required String selected}) {
    List<String> list = _styleInfo!.nonPreferredFits.fits;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _styleInfo = _styleInfo!.copyWith(nonPreferredFits: FitModel(fits: list));
    notifyListeners();
  }

  void updateBadBodyTypes({required String selected}) {
    List<String> list = _styleInfo!.badBodyTypes.bodyTypes;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _styleInfo =
        _styleInfo!.copyWith(badBodyTypes: BodyTypeModel(bodyTypes: list));
    notifyListeners();
  }

  Future<void> getStyleInfo({
    required int memberId,
    bool refresh = false,
  }) async {
    if (_loadingStyeInfo || (!refresh && _styleInfo != null)) return;
    try {
      _loadingStyeInfo = true;
      notifyListeners();
      final resp =
          await repositoryProvider.repository.getStyleInfo(memberId: memberId);
      _styleInfo = resp.result;
      _topSize = int.parse(style.spec.topSize.substring(5));
      _bottomSize = int.parse(style.spec.bottomSize.substring(5));
    } catch (e) {
      if (e is ApiResponse) {
        Exception(e.message);
      } else {
        Exception(e);
      }
    } finally {
      _loadingStyeInfo = false;
      notifyListeners();
    }
  }

  /// 스타일 정보 변경
}
