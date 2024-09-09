// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordi_posting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordiPosting _$CoordiPostingFromJson(Map<String, dynamic> json) =>
    CoordiPosting(
      minTemp: (json['minTemp'] as num?)?.toInt(),
      maxTemp: (json['maxTemp'] as num?)?.toInt(),
      style: json['style'] as String?,
      content: json['content'] as String?,
      fromMemberId: (json['fromMemberId'] as num?)?.toInt(),
      toMemberId: (json['toMemberId'] as num?)?.toInt(),
      writerId: (json['writerId'] as num?)?.toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CoordiPostingToJson(CoordiPosting instance) =>
    <String, dynamic>{
      'minTemp': instance.minTemp,
      'maxTemp': instance.maxTemp,
      'style': instance.style,
      'content': instance.content,
      'fromMemberId': instance.fromMemberId,
      'toMemberId': instance.toMemberId,
      'writerId': instance.writerId,
      'image': instance.image,
    };

CoordiPostingResult _$CoordiPostingResultFromJson(Map<String, dynamic> json) =>
    CoordiPostingResult(
      fromMember:
          MemberPreview.fromJson(json['fromMember'] as Map<String, dynamic>),
      toMember:
          MemberPreview.fromJson(json['toMember'] as Map<String, dynamic>),
      writerId: (json['writerId'] as num).toInt(),
      nickname: json['nickname'] as String,
      loginId: json['loginId'] as String,
      postingId: (json['postingId'] as num).toInt(),
      minTemp: (json['minTemp'] as num).toInt(),
      maxTemp: (json['maxTemp'] as num).toInt(),
      content: json['content'] as String,
      imageInfo: (json['imageInfo'] as List<dynamic>)
          .map((e) => ImageInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      likes: (json['likes'] as num).toInt(),
    );

Map<String, dynamic> _$CoordiPostingResultToJson(
        CoordiPostingResult instance) =>
    <String, dynamic>{
      'fromMember': instance.fromMember,
      'toMember': instance.toMember,
      'writerId': instance.writerId,
      'nickname': instance.nickname,
      'loginId': instance.loginId,
      'postingId': instance.postingId,
      'minTemp': instance.minTemp,
      'maxTemp': instance.maxTemp,
      'content': instance.content,
      'imageInfo': instance.imageInfo,
      'likes': instance.likes,
    };

MemberPreview _$MemberPreviewFromJson(Map<String, dynamic> json) =>
    MemberPreview(
      memberId: (json['memberId'] as num).toInt(),
      profileImage: json['profileImage'] as String,
    );

Map<String, dynamic> _$MemberPreviewToJson(MemberPreview instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'profileImage': instance.profileImage,
    };

ImageInfo _$ImageInfoFromJson(Map<String, dynamic> json) => ImageInfo(
      imageId: (json['imageId'] as num).toInt(),
      image: json['image'] as String,
      linkList: (json['linkList'] as List<dynamic>)
          .map((e) => LinkList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageInfoToJson(ImageInfo instance) => <String, dynamic>{
      'imageId': instance.imageId,
      'image': instance.image,
      'linkList': instance.linkList,
    };

LinkList _$LinkListFromJson(Map<String, dynamic> json) => LinkList(
      imageUrlId: (json['imageUrlId'] as num).toInt(),
      link: json['link'] as String,
    );

Map<String, dynamic> _$LinkListToJson(LinkList instance) => <String, dynamic>{
      'imageUrlId': instance.imageUrlId,
      'link': instance.link,
    };

SavedResult _$SavedResultFromJson(Map<String, dynamic> json) => SavedResult(
      postingId: (json['postingId'] as num).toInt(),
      savedPostingId: (json['savedPostingId'] as num).toInt(),
    );

Map<String, dynamic> _$SavedResultToJson(SavedResult instance) =>
    <String, dynamic>{
      'postingId': instance.postingId,
      'savedPostingId': instance.savedPostingId,
    };
