import 'package:lyc_flutter_project/model/member.dart';

// member1을 로그인한 유저로 가정합니다
const int cur_member = 1;

class TempMemberData {
  final member1 = Member(1, 'katarinabluu', 'pw', 'karina@gmail.com', 'Karina', '안녕 난 카리나', 'assets/ex_profile.png', 's', 'c', 'i', 'p', 0, 0);
  final member2 = Member(2, 'imwinter', 'pw', 'winter@gmail.com', 'Winter', '안녕 난 윈터', 'assets/ex_profile2.png', 's', 'c', 'i', 'p', 0, 0);

  late final List<Member> members;
  TempMemberData() {
    members = [member1, member2];
  }
}