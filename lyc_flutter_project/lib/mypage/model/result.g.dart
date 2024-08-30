// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordieResult _$CoordieResultFromJson(Map<String, dynamic> json) =>
    CoordieResult(
      memberId: (json['memberId'] as num).toInt(),
      imageList: (json['imageList'] as List<dynamic>)
          .map((e) => CoordiPostingPreview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoordieResultToJson(CoordieResult instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'imageList': instance.imageList,
    };

ClosetResult _$ClosetResultFromJson(Map<String, dynamic> json) => ClosetResult(
      memberId: (json['memberId'] as num).toInt(),
      clothesList: (json['clothesList'] as List<dynamic>)
          .map((e) => ClosetPostingPreview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClosetResultToJson(ClosetResult instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'clothesList': instance.clothesList,
    };
