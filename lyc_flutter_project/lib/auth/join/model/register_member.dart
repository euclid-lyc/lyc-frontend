import '../model/member.dart';
import '../model/pushset.dart';
import 'join_info.dart';

class RegisterMember {
  final String verificationCode;
  final Member member;
  final JoinInfo info;
  final PushSet pushSet;

  RegisterMember({
    required this.verificationCode,
    required this.member,
    required this.info,
    required this.pushSet,
  });

  Map<String, dynamic> toJson() {
    return {
      'verificationCode': verificationCode,
      'member': member.toJson(),
      'info': info.toJson(),
      'pushSet': pushSet.toJson(),
    };
  }
}
