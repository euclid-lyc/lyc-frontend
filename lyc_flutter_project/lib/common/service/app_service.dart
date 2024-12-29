import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lyc_flutter_project/config/secret.dart';
import 'package:lyc_flutter_project/mypage/repository/mypage_repository.dart';

// 로그인 상태를 관리합니다.
// 로그인한 사용자의 memberId, profileImage를 저장합니다.
class AppService extends ChangeNotifier {
  final FlutterSecureStorage storage;
  final MypageRepository repository;

  AppService({
    required this.storage,
    required this.repository,
  }) {
    init();
  }

  bool isLoggedIn = false;
  int memberId = -1;
  String profileImage = '';

  Future<void> init() async {
    final refreshToken = await storage.read(key: refreshTokenKey);
    final accessToken = await storage.read(key: accessTokenKey);
    final storedMemberId = await storage.read(key: memberIdKey);

    if (refreshToken != null && accessToken != null && storedMemberId != null) {
      memberId = int.parse(storedMemberId);
      final result = await getProfile();
      if (result) {
        isLoggedIn = true;
      }
    }
  }

  Future<bool> getProfile() async {
    if (memberId < 0) return false;

    try {
      final resp = await repository.getProfile(memberId: memberId);

      if (resp.isSuccess) {
        profileImage = resp.result.profileImage;
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("[AppService] getProfile 에러 발생: $e");
      return false;
    }
  }
}
