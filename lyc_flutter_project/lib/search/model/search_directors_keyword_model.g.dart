// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_directors_keyword_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchDirectorsKeywordListModel _$SearchDirectorsKeywordListModelFromJson(
        Map<String, dynamic> json) =>
    SearchDirectorsKeywordListModel(
      members: (json['members'] as List<dynamic>)
          .map((e) =>
              SearchDirectorsKeywordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchDirectorsKeywordListModelToJson(
        SearchDirectorsKeywordListModel instance) =>
    <String, dynamic>{
      'members': instance.members,
    };

SearchDirectorsKeywordModel _$SearchDirectorsKeywordModelFromJson(
        Map<String, dynamic> json) =>
    SearchDirectorsKeywordModel(
      memberId: (json['memberId'] as num).toInt(),
      nickname: json['nickname'] as String,
      loginId: json['loginId'] as String,
      introduction: json['introduction'] as String,
      profileImage: json['profileImage'] as String,
      styles: (json['styles'] as List<dynamic>)
          .map((e) => SearchDirectorsKeywordStyleModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchDirectorsKeywordModelToJson(
        SearchDirectorsKeywordModel instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'nickname': instance.nickname,
      'loginId': instance.loginId,
      'introduction': instance.introduction,
      'profileImage': instance.profileImage,
      'styles': instance.styles,
    };

SearchDirectorsKeywordStyleModel _$SearchDirectorsKeywordStyleModelFromJson(
        Map<String, dynamic> json) =>
    SearchDirectorsKeywordStyleModel(
      styles:
          (json['styles'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SearchDirectorsKeywordStyleModelToJson(
        SearchDirectorsKeywordStyleModel instance) =>
    <String, dynamic>{
      'styles': instance.styles,
    };
