import 'package:json_annotation/json_annotation.dart';

part 'other_matters.g.dart';

@JsonSerializable()
class OtherMatters {
  final int minPrice;
  final int maxPrice;
  final String dateToUse;
  final String desiredDate;
  final String text;
  final bool isShareClothesList;

  OtherMatters({
    required this.minPrice,
    required this.maxPrice,
    required this.dateToUse,
    required this.desiredDate,
    required this.text,
    required this.isShareClothesList,
  });

  factory OtherMatters.fromJson(Map<String, dynamic> json) =>
      _$OtherMattersFromJson(json);

  Map<String, dynamic> toJson() => _$OtherMattersToJson(this);

  static OtherMatters defaultValue() {
    return OtherMatters(
      minPrice: 0,
      maxPrice: 0,
      dateToUse: '',
      desiredDate: '',
      text: '',
      isShareClothesList: false,
    );
  }
}
