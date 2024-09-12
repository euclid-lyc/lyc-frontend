import 'package:json_annotation/json_annotation.dart';

part 'paginate_query.g.dart';

@JsonSerializable()
class PaginateQuery {
  final int pageSize;
  final String cursorDateTime;

  const PaginateQuery({
    required this.pageSize,
    required this.cursorDateTime,
  });

  PaginateQuery copyWith({
    int? pageSize,
    String? cursorDateTime,
  }) {
    return PaginateQuery(
      pageSize: pageSize ?? this.pageSize,
      cursorDateTime: cursorDateTime ?? this.cursorDateTime,
    );
  }

  factory PaginateQuery.fromJson(Map<String, dynamic> json) =>
      _$PaginateQueryFromJson(json);

  Map<String, dynamic> toJson() => _$PaginateQueryToJson(this);
}
