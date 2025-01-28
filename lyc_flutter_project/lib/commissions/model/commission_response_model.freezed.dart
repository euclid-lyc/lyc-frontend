// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commission_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommissionResponseModel _$CommissionResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CommissionResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CommissionResponseModel {
  int get commissionId => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  CommissionModel get commission => throw _privateConstructorUsedError;

  /// Serializes this CommissionResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionResponseModelCopyWith<CommissionResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionResponseModelCopyWith<$Res> {
  factory $CommissionResponseModelCopyWith(CommissionResponseModel value,
          $Res Function(CommissionResponseModel) then) =
      _$CommissionResponseModelCopyWithImpl<$Res, CommissionResponseModel>;
  @useResult
  $Res call(
      {int commissionId,
      String createdDate,
      String status,
      CommissionModel commission});
}

/// @nodoc
class _$CommissionResponseModelCopyWithImpl<$Res,
        $Val extends CommissionResponseModel>
    implements $CommissionResponseModelCopyWith<$Res> {
  _$CommissionResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commissionId = null,
    Object? createdDate = null,
    Object? status = null,
    Object? commission = null,
  }) {
    return _then(_value.copyWith(
      commissionId: null == commissionId
          ? _value.commissionId
          : commissionId // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      commission: null == commission
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as CommissionModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionResponseModelImplCopyWith<$Res>
    implements $CommissionResponseModelCopyWith<$Res> {
  factory _$$CommissionResponseModelImplCopyWith(
          _$CommissionResponseModelImpl value,
          $Res Function(_$CommissionResponseModelImpl) then) =
      __$$CommissionResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int commissionId,
      String createdDate,
      String status,
      CommissionModel commission});
}

/// @nodoc
class __$$CommissionResponseModelImplCopyWithImpl<$Res>
    extends _$CommissionResponseModelCopyWithImpl<$Res,
        _$CommissionResponseModelImpl>
    implements _$$CommissionResponseModelImplCopyWith<$Res> {
  __$$CommissionResponseModelImplCopyWithImpl(
      _$CommissionResponseModelImpl _value,
      $Res Function(_$CommissionResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commissionId = null,
    Object? createdDate = null,
    Object? status = null,
    Object? commission = null,
  }) {
    return _then(_$CommissionResponseModelImpl(
      commissionId: null == commissionId
          ? _value.commissionId
          : commissionId // ignore: cast_nullable_to_non_nullable
              as int,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      commission: null == commission
          ? _value.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as CommissionModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionResponseModelImpl implements _CommissionResponseModel {
  _$CommissionResponseModelImpl(
      {required this.commissionId,
      required this.createdDate,
      required this.status,
      required this.commission});

  factory _$CommissionResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionResponseModelImplFromJson(json);

  @override
  final int commissionId;
  @override
  final String createdDate;
  @override
  final String status;
  @override
  final CommissionModel commission;

  @override
  String toString() {
    return 'CommissionResponseModel(commissionId: $commissionId, createdDate: $createdDate, status: $status, commission: $commission)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionResponseModelImpl &&
            (identical(other.commissionId, commissionId) ||
                other.commissionId == commissionId) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.commission, commission) ||
                other.commission == commission));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, commissionId, createdDate, status, commission);

  /// Create a copy of CommissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionResponseModelImplCopyWith<_$CommissionResponseModelImpl>
      get copyWith => __$$CommissionResponseModelImplCopyWithImpl<
          _$CommissionResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CommissionResponseModel implements CommissionResponseModel {
  factory _CommissionResponseModel(
          {required final int commissionId,
          required final String createdDate,
          required final String status,
          required final CommissionModel commission}) =
      _$CommissionResponseModelImpl;

  factory _CommissionResponseModel.fromJson(Map<String, dynamic> json) =
      _$CommissionResponseModelImpl.fromJson;

  @override
  int get commissionId;
  @override
  String get createdDate;
  @override
  String get status;
  @override
  CommissionModel get commission;

  /// Create a copy of CommissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionResponseModelImplCopyWith<_$CommissionResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
