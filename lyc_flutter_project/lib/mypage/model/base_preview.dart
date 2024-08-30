import 'package:json_annotation/json_annotation.dart';

part 'base_preview.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BasePreview<T> {
  final String code;
  final String message;
  final T result;
  final bool isSuccess;

  BasePreview({
    required this.code,
    required this.message,
    required this.result,
    required this.isSuccess,
  });

  factory BasePreview.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$BasePreviewFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BasePreviewToJson(this, toJsonT);
}