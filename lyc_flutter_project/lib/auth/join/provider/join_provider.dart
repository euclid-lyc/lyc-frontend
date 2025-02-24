import 'package:flutter/foundation.dart';
import 'package:lyc_flutter_project/auth/join/model/register_member.dart';
import '../../service/storage_service.dart';
import '../model/join_info.dart';
import '../model/member.dart';
import '../model/pushset.dart';
import '../model/user_verification.dart';
import '../repository/join_repository.dart';

class JoinProvider extends ChangeNotifier {
  final JoinRepository joinRepository;
  final StorageService storageService;
  bool _isLoading = false;
  String? _errorMessage;
  JoinInfo _joinInfo;
  PushSet _pushSet;
  Member _member;
  String _imagePath = '';

  int? _topSize = 55;
  int? _bottomSize = 28;

  JoinProvider(this.storageService, this.joinRepository)
      : _joinInfo = JoinInfo.defaultValue(),
        _pushSet = PushSet.defaultValue(),
        _member = Member.defaultValue();

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  JoinInfo get joinInfo => _joinInfo;

  PushSet get pushSet => _pushSet;

  Member get member => _member;

  String get imagePath => _imagePath;

  String get pw => _member.loginPw;

  get topSize => _topSize;

  get bottomSize => _bottomSize;

  bool get dm => _pushSet.dm;

  bool get feed => _pushSet.feed;

  bool get ad => _pushSet.ad;

  bool get likeMark => _pushSet.likeMark;

  bool get event => _pushSet.event;

  bool get schedule => _pushSet.schedule;

  set isLoading(bool isLoading){
    _isLoading = isLoading;
  }

  set joinInfo(JoinInfo value) {
    _joinInfo = value;
    notifyListeners();
  }

  set pushSet(PushSet value) {
    _pushSet = value;
    notifyListeners();
  }

  set member(Member value) {
    _member = value;
    notifyListeners();
  }

  set imagePath(String value) {
    _imagePath = value;
    notifyListeners();
  }

  void updateName(String name) {
    _member = _member.copyWith(name: name);
    notifyListeners();
  }

  void updateLoginId(String loginId) {
    _member = _member.copyWith(loginId: loginId);
    notifyListeners();
  }

  void updateLoginPw(String loginPw) {
    _member = _member.copyWith(loginPw: loginPw);
    notifyListeners();
  }

  void updateLoginPwCheck(String loginPwCheck) {
    _member = _member.copyWith(loginPwCheck: loginPwCheck);
    notifyListeners();
  }

  void updateEmail(String email) {
    _member = _member.copyWith(email: email);
    notifyListeners();
  }

  void updatePhone(String phone) {
    _member = _member.copyWith(phone: phone);
    notifyListeners();
  }

  void updateNickname(String nickname) {
    _member = _member.copyWith(nickname: nickname);
    notifyListeners();
  }

  void updateIntroduction(String introduction) {
    _member = _member.copyWith(introduction: introduction);
    notifyListeners();
  }

  void updatePostalCode(int postalCode) {
    _joinInfo = _joinInfo.copyWith(postalCode: postalCode);
    notifyListeners();
  }

  void updateAddress(String address) {
    _joinInfo = _joinInfo.copyWith(address: address);
    notifyListeners();
  }

  void updateDetailAddress(String detailAddress) {
    _joinInfo = _joinInfo.copyWith(detailAddress: detailAddress);
    notifyListeners();
  }

  void updateHeight({required int height}) {
    _joinInfo = _joinInfo.copyWith(height: height);
    notifyListeners();
  }

  void updateWeight({required int weight}) {
    _joinInfo = _joinInfo.copyWith(weight: weight);
    notifyListeners();
  }

  void updateTopSize({required int topSize}) {
    _topSize = topSize;
    notifyListeners();
  }

  void rollbackTopSize() {
    _topSize = int.parse(_joinInfo.topSize.substring(5));
    notifyListeners();
  }

  void rollbackBottomSize() {
    _bottomSize = int.parse(_joinInfo.bottomSize.substring(5));
    notifyListeners();
  }

  void updateBottomSize({required int bottomSize}) {
    _bottomSize = bottomSize;
    notifyListeners();
  }

  void updateText({required String text}) {
    _joinInfo = _joinInfo.copyWith(text: text);
    notifyListeners();
  }

  void updatePreferredStyle({required String selected}) {
    List<String> list = _joinInfo.infoStyle.preferredStyleList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _joinInfo = _joinInfo.copyWith(
        infoStyle: _joinInfo.infoStyle.copyWith(preferredStyleList: list));
    notifyListeners();
  }

  void updateNonPreferredStyle({required String selected}) {
    List<String> list = _joinInfo.infoStyle.nonPreferredStyleList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _joinInfo = _joinInfo.copyWith(
        infoStyle: _joinInfo.infoStyle.copyWith(nonPreferredStyleList: list));
    notifyListeners();
  }

  void updatePreferredMaterials({required String selected}) {
    List<String> list = _joinInfo.infoMaterial.preferredMaterialList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _joinInfo = _joinInfo.copyWith(
        infoMaterial:
            _joinInfo.infoMaterial.copyWith(preferredMaterialList: list));
    notifyListeners();
  }

  void updateNonPreferredMaterials({required String selected}) {
    List<String> list = _joinInfo.infoMaterial.nonPreferredMaterialList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _joinInfo = _joinInfo.copyWith(
        infoMaterial:
            _joinInfo.infoMaterial.copyWith(nonPreferredMaterialList: list));
    notifyListeners();
  }

  void updatePreferredFits({required String selected}) {
    List<String> list = _joinInfo.infoFit.preferredFitList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _joinInfo = _joinInfo.copyWith(
        infoFit: _joinInfo.infoFit.copyWith(preferredFitList: list));
    notifyListeners();
  }

  void updateNonPreferredFits({required String selected}) {
    List<String> list = _joinInfo.infoFit.nonPreferredFitList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _joinInfo = _joinInfo.copyWith(
        infoFit: _joinInfo.infoFit.copyWith(nonPreferredFitList: list));
    notifyListeners();
  }

  void updateBadBodyTypes({required String selected}) {
    List<String> list = _joinInfo.infoBodyType.badBodyTypeList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _joinInfo = _joinInfo.copyWith(
        infoBodyType: _joinInfo.infoBodyType.copyWith(badBodyTypeList: list));
    notifyListeners();
  }

  void updateGoodBodyTypes({required String selected}) {
    List<String> list = _joinInfo.infoBodyType.goodBodyTypeList;
    if (list.contains(selected)) {
      list.remove(selected);
    } else {
      list.add(selected);
    }
    _joinInfo = _joinInfo.copyWith(
        infoBodyType: _joinInfo.infoBodyType.copyWith(goodBodyTypeList: list));
    notifyListeners();
  }

  void updateDm(bool dm) {
    _pushSet = _pushSet.copyWith(dm: dm);
    notifyListeners();
  }

  void updateFeed(bool feed) {
    _pushSet = _pushSet.copyWith(feed: feed);
    notifyListeners();
  }

  void updateSchedule(bool schedule) {
    _pushSet = _pushSet.copyWith(schedule: schedule);
    notifyListeners();
  }

  void updateLikeMark(bool likeMark) {
    _pushSet = _pushSet.copyWith(likeMark: likeMark);
    notifyListeners();
  }

  void updateEvent(bool event) {
    _pushSet = _pushSet.copyWith(event: event);
    notifyListeners();
  }

  void updateAd(bool ad) {
    _pushSet = _pushSet.copyWith(ad: ad);
    notifyListeners();
  }

  // 인증 코드 요청
  Future<void> requestVerificationCode() async {
    _isLoading = true;
    notifyListeners();

    try {
      final userVerification = UserVerification(
        email: _member.email,
        loginId: _member.loginId,
        loginPw: _member.loginPw,
        loginPwCheck: _member.loginPwCheck,
      );
      await joinRepository.getVerificationCode(
          userVerification: userVerification);
    } catch (e) {
      _errorMessage = '인증 코드 요청 실패: ${e.toString()}';
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 인증 코드 검증
  Future<void> checkVerificationCode(String verificationCode) async {
    _isLoading = true;
    notifyListeners();

    try {
      await joinRepository.sendVerification(verificationCode);
      await storageService.write("verificationCode", verificationCode);
    } catch (e) {
      _errorMessage = '인증 코드 검증 실패: ${e.toString()}';
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 회원 가입
  Future<void> register() async {
    _isLoading = true;
    notifyListeners();

    //이미지 업로드 안 할 경우 api를 null로 보낼 순 없어서 임의값
    if (_imagePath == '') {
      _imagePath = '/sdcard/0621.png';
    }

    try {
      final verificationCode = await storageService.read("verificationCode");
      await joinRepository.registerMember(
        registerMember: RegisterMember(
            verificationCode: verificationCode!,
            member: _member,
            info: _joinInfo,
            pushSet: _pushSet),
        imagePath: _imagePath,
      );
    } catch (e) {
      _errorMessage = '회원 가입 실패: ${e.toString()}';
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
