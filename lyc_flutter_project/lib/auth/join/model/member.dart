class Member {
  final String name;
  final String loginId;
  final String loginPw;
  final String loginPwCheck;
  final String email;
  final String phone;
  final String nickname;
  final String introduction;

  Member({
    required this.name,
    required this.loginId,
    required this.loginPw,
    required this.loginPwCheck,
    required this.email,
    required this.phone,
    required this.nickname,
    required this.introduction,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'loginId': loginId,
      'loginPw': loginPw,
      'loginPwCheck': loginPwCheck,
      'email': email,
      'phone': phone,
      'nickname': nickname,
      'introduction': introduction,
    };
  }

  Member copyWith({
    String? name,
    String? loginId,
    String? loginPw,
    String? loginPwCheck,
    String? email,
    String? phone,
    String? nickname,
    String? introduction,
  }) {
    return Member(
      name: name ?? this.name,
      loginId: loginId ?? this.loginId,
      loginPw: loginPw ?? this.loginPw,
      loginPwCheck: loginPwCheck ?? this.loginPwCheck,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      nickname: nickname ?? this.nickname,
      introduction: introduction ?? this.introduction,
    );
  }

  static Member defaultValue() {
    return Member(
      name: '',
      loginId: '',
      loginPw: '',
      loginPwCheck: '',
      email: '',
      phone: '',
      nickname: '',
      introduction: '',
    );
  }
}
