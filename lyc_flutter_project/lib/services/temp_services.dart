import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/model/member.dart';

class TempServices {
  static final TempMemberData _members = TempMemberData();

  static Member getMemberById (int id) {
    final members = _members.members;
    return members.firstWhere((element) => element.id == id,);
  }
}

// 여기에 기타 메서드 정의해주시면 됩니다
// 팔로우 기능, 게시글 등록/삭제 기능, 저장 기능, 좋아요 기능