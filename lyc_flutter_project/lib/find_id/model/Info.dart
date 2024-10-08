import 'package:json_annotation/json_annotation.dart';

part 'Info.g.dart';

@JsonSerializable()
class Info {
  final String name;
  final String email;
  Info({required this.name, required this.email});


  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
