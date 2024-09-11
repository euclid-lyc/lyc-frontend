import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final String code;
  final String message;
  final T result;
  final bool isSuccess;
  final Map<String, List<String>>? headers;

  ApiResponse({
    required this.code,
    required this.message,
    required this.result,
    required this.isSuccess,
    this.headers,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) => _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
