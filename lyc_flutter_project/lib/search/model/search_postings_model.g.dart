// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_postings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPostingsListModel _$SearchPostingsListModelFromJson(
        Map<String, dynamic> json) =>
    SearchPostingsListModel(
      imageList: (json['imageList'] as List<dynamic>)
          .map((e) => SearchPostingsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchPostingsListModelToJson(
        SearchPostingsListModel instance) =>
    <String, dynamic>{
      'imageList': instance.imageList,
    };

SearchPostingsModel _$SearchPostingsModelFromJson(Map<String, dynamic> json) =>
    SearchPostingsModel(
      postingId: (json['postingId'] as num).toInt(),
      image: json['image'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$SearchPostingsModelToJson(
        SearchPostingsModel instance) =>
    <String, dynamic>{
      'postingId': instance.postingId,
      'image': instance.image,
      'createdAt': instance.createdAt,
    };
