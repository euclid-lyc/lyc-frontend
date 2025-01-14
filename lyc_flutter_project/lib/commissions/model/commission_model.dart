import 'package:json_annotation/json_annotation.dart';

part 'commission_model.g.dart';

@JsonSerializable()
class CommissionListModel {
  List<CommissionModel> commissions;

  CommissionListModel({
    required this.commissions,
  });

  factory CommissionListModel.fromJson(Map<String, dynamic> json) =>
      _$CommissionListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommissionListModelToJson(this);
}

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

  CommissionModel copyWith({
    int? commissionId,
    String? profileImage,
    String? nickname,
    String? loginId,
    String? createdAt,
  }) {
    return CommissionModel(
      commissionId: commissionId ?? this.commissionId,
      profileImage: profileImage ?? this.profileImage,
      nickname: nickname ?? this.nickname,
      loginId: loginId ?? this.loginId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory CommissionModel.fromJson(Map<String, dynamic> json) =>
      _$CommissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommissionModelToJson(this);
}
