import 'package:flutter/foundation.dart';
import 'package:lyc_flutter_project/auth/join/model/register_member_dto.dart';
import '../model/join_info.dart';
import '../model/member.dart';
import '../model/pushset.dart';
import '../model/user_verification.dart';
import '../repository/join_repository.dart';

class JoinProvider extends ChangeNotifier {
  final JoinRepository joinRepository;
  bool _isLoading = false;
  String? _errorMessage;
  JoinInfo _joinInfo;
  PushSet _pushSet;
  Member _member;
  String _imagePath = '';

  JoinProvider({required this.joinRepository})
      : _joinInfo = JoinInfo.defaultValue(),
        _pushSet = PushSet.defaultValue(),
        _member = Member.defaultValue();

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  JoinInfo get joinInfo => _joinInfo;

  PushSet get pushSet => _pushSet;

  Member get member => _member;

  String get imagePath => _imagePath;

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

  // 인증 코드 요청
  Future<void> requestVerificationCode({
    required String email,
    required String loginId,
    required String loginPw,
    required String loginPwCheck,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final userVerification = UserVerification(
        email: email,
        loginId: loginId,
        loginPw: loginPw,
        loginPwCheck: loginPwCheck,
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
  Future<void> verifyCode({required String verificationCode}) async {
    _isLoading = true;
    notifyListeners();

    try {
      await joinRepository.sendVerification(verificationCode);
    } catch (e) {
      _errorMessage = '인증 코드 검증 실패: ${e.toString()}';
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // 회원 가입
  Future<void> register({required verificationCode}) async {
    _isLoading = true;
    notifyListeners();
    try {
      await joinRepository.registerMember(
        registerMemberDTO: RegisterMemberDTO(
            verificationCode: verificationCode,
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
