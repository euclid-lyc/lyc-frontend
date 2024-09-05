import 'package:lyc_flutter_project/data/temp_image_data.dart';
import 'package:lyc_flutter_project/data/temp_member_data.dart';
import 'package:lyc_flutter_project/data/temp_posting_data.dart';
import 'package:lyc_flutter_project/model/image.dart';
import 'package:lyc_flutter_project/model/member.dart';
import 'package:lyc_flutter_project/model/posting.dart';

class TempServices {
  static final TempMemberData _members = TempMemberData();
  static Member getMemberById (int id) {
    final members = _members.members;
    return members.firstWhere((element) => element.id == id,);
  }

  static final TempImage _images = TempImage();
  static PostingImage getImageByPostingId (int id) {
    final images = _images.images;
    return images.firstWhere((element) => element.posting_id == id,
        orElse: () => throw StateError('Image not found for posting id $id'));
  }

  static final TempPostingData _postings = TempPostingData();
  static Posting getPostingByPostingId (int id) {
    final postings = _postings.postings;
    return postings.firstWhere((element) => element.id == id,);
  }
}

// 여기에 기타 메서드 정의해주시면 됩니다
// 팔로우 기능, 게시글 등록/삭제 기능, 저장 기능, 좋아요 기능