// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginate_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginateQuery _$PaginateQueryFromJson(Map<String, dynamic> json) =>
    PaginateQuery(
      pageSize: (json['pageSize'] as num).toInt(),
      cursorDateTime: json['cursorDateTime'] as String,
    );

Map<String, dynamic> _$PaginateQueryToJson(PaginateQuery instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'cursorDateTime': instance.cursorDateTime,
    };
