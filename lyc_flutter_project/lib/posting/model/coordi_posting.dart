import 'package:json_annotation/json_annotation.dart';

part 'coordi_posting.g.dart';

@JsonSerializable()
class CoordiPosting {
  final int? minTemp;
  final int? maxTemp;
  final String? style;
  final String? content;
  final int? fromMemberId;
  final int? toMemberId;
  final int? writerId;
  final String? image;
  final List<String> linkList = [];

  CoordiPosting({
    this.minTemp,
    this.maxTemp,
    this.style,
    this.content,
    this.fromMemberId,
    this.toMemberId,
    this.writerId,
    this.image,
  });

  CoordiPosting copyWith({
    int? minTemp,
    int? maxTemp,
    String? style,
    String? content,
    int? toMemberId,
    String? image,
  }) {
    return CoordiPosting(
      minTemp: minTemp ?? this.minTemp,
      maxTemp: maxTemp ?? this.maxTemp,
      style: style ?? this.style,
      content: content ?? this.content,
      fromMemberId: fromMemberId,
      toMemberId: toMemberId ?? this.toMemberId,
      writerId: writerId,
    );
  }

  Map<String, dynamic> toJson() => _$CoordiPostingToJson(this);
}

@JsonSerializable()
class CoordiPostingResult {
  final MemberPreview fromMember;
  final MemberPreview toMember;
  final String writerId;
  final String nickname;
  final String loginId;
  final int postingId;
  final int minTemp;
  final int maxTemp;
  final String content;
  final ImageInfo imageInfo;
  final int likes;

  CoordiPostingResult({
    required this.fromMember,
    required this.toMember,
    required this.writerId,
    required this.nickname,
    required this.loginId,
    required this.postingId,
    required this.minTemp,
    required this.maxTemp,
    required this.content,
    required this.imageInfo,
    required this.likes,
  });

  factory CoordiPostingResult.fromJson(Map<String, dynamic> json) =>
      _$CoordiPostingResultFromJson(json);

  Map<String, dynamic> toJson() => _$CoordiPostingResultToJson(this);
}

@JsonSerializable()
class MemberPreview {
  final int memberId;
  final String profileImage;

  MemberPreview({
    required this.memberId,
    required this.profileImage,
  });

  factory MemberPreview.fromJson(Map<String, dynamic> json) =>
      _$MemberPreviewFromJson(json);

  Map<String, dynamic> toJson() => _$MemberPreviewToJson(this);
}

@JsonSerializable()
class ImageInfo {
  final int imageId;
  final LinkList linkList;

  ImageInfo({
    required this.imageId,
    required this.linkList,
  });

  factory ImageInfo.fromJson(Map<String, dynamic> json) =>
      _$ImageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageInfoToJson(this);
}

@JsonSerializable()
class LinkList {
  final int imageUrlId;
  final String link;

  LinkList({
    required this.imageUrlId,
    required this.link,
  });

  factory LinkList.fromJson(Map<String, dynamic> json) =>
      _$LinkListFromJson(json);

  Map<String, dynamic> toJson() => _$LinkListToJson(this);
}
