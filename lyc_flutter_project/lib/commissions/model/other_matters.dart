import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_matters.freezed.dart';
part 'other_matters.g.dart';

@freezed
class OtherMatters with _$OtherMatters {
  const factory OtherMatters({
    required int minPrice,
    required int maxPrice,
    required String dateToUse,
    required String desiredDate,
    required String text,
    required bool isShared,
  }) = _OtherMatters;

  factory OtherMatters.fromJson(Map<String, dynamic> json) => _$OtherMattersFromJson(json);

  factory OtherMatters.defaultValue() => const OtherMatters(
    minPrice: 0,
    maxPrice: 0,
    dateToUse: '',
    desiredDate: '',
    text: '',
    isShared: false,
  );
}
