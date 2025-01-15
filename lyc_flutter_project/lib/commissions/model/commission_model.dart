import 'package:freezed_annotation/freezed_annotation.dart';

part 'commission_model.g.dart';

@JsonSerializable()
class CommissionModel {
  final int commissionId;
  final String profileImage;
  final String nickname;
  final String loginId;
  final String createdAt;

  CommissionModel({
    required this.commissionId,
    required this.profileImage,
    required this.nickname,
    required this.loginId,
    required this.createdAt,
  });

  factory CommissionModel.fromJson(Map<String, dynamic> json) =>
      _$CommissionModelFromJson(json);


  Map<String, dynamic> toJson() => _$CommissionModelToJson(this);

  factory CommissionModel.defaultValue() {
    return CommissionModel(
      commissionId: 0,
      profileImage: '',
      nickname: '',
      loginId: '',
      createdAt: '',
    );
  }
}
