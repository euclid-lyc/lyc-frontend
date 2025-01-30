// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_directors_general_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchDirectorsGeneralListModel _$SearchDirectorsGeneralListModelFromJson(
        Map<String, dynamic> json) =>
    SearchDirectorsGeneralListModel(
      members: (json['members'] as List<dynamic>)
          .map((e) =>
              SearchDirectorsGeneralModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchDirectorsGeneralListModelToJson(
        SearchDirectorsGeneralListModel instance) =>
    <String, dynamic>{
      'members': instance.members,
    };

SearchDirectorsGeneralModel _$SearchDirectorsGeneralModelFromJson(
        Map<String, dynamic> json) =>
    SearchDirectorsGeneralModel(
      memberId: (json['memberId'] as num).toInt(),
      loginId: json['loginId'] as String,
      profileImage: json['profileImage'] as String,
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$SearchDirectorsGeneralModelToJson(
        SearchDirectorsGeneralModel instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'loginId': instance.loginId,
      'profileImage': instance.profileImage,
      'nickname': instance.nickname,
    };
