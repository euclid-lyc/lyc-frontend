// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commission_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommissionRequest _$CommissionRequestFromJson(Map<String, dynamic> json) {
  return _CommissionRequest.fromJson(json);
}

/// @nodoc
mixin _$CommissionRequest {
  int get directorId => throw _privateConstructorUsedError;
  BasicInfo get basicInfo => throw _privateConstructorUsedError;
  DesiredStyle get desiredStyle => throw _privateConstructorUsedError;
  OtherMatters get otherMatters => throw _privateConstructorUsedError;

  /// Serializes this CommissionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionRequestCopyWith<CommissionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionRequestCopyWith<$Res> {
  factory $CommissionRequestCopyWith(
          CommissionRequest value, $Res Function(CommissionRequest) then) =
      _$CommissionRequestCopyWithImpl<$Res, CommissionRequest>;
  @useResult
  $Res call(
      {int directorId,
      BasicInfo basicInfo,
      DesiredStyle desiredStyle,
      OtherMatters otherMatters});

  $BasicInfoCopyWith<$Res> get basicInfo;
  $DesiredStyleCopyWith<$Res> get desiredStyle;
  $OtherMattersCopyWith<$Res> get otherMatters;
}

/// @nodoc
class _$CommissionRequestCopyWithImpl<$Res, $Val extends CommissionRequest>
    implements $CommissionRequestCopyWith<$Res> {
  _$CommissionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? directorId = null,
    Object? basicInfo = null,
    Object? desiredStyle = null,
    Object? otherMatters = null,
  }) {
    return _then(_value.copyWith(
      directorId: null == directorId
          ? _value.directorId
          : directorId // ignore: cast_nullable_to_non_nullable
              as int,
      basicInfo: null == basicInfo
          ? _value.basicInfo
          : basicInfo // ignore: cast_nullable_to_non_nullable
              as BasicInfo,
      desiredStyle: null == desiredStyle
          ? _value.desiredStyle
          : desiredStyle // ignore: cast_nullable_to_non_nullable
              as DesiredStyle,
      otherMatters: null == otherMatters
          ? _value.otherMatters
          : otherMatters // ignore: cast_nullable_to_non_nullable
              as OtherMatters,
    ) as $Val);
  }

  /// Create a copy of CommissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BasicInfoCopyWith<$Res> get basicInfo {
    return $BasicInfoCopyWith<$Res>(_value.basicInfo, (value) {
      return _then(_value.copyWith(basicInfo: value) as $Val);
    });
  }

  /// Create a copy of CommissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DesiredStyleCopyWith<$Res> get desiredStyle {
    return $DesiredStyleCopyWith<$Res>(_value.desiredStyle, (value) {
      return _then(_value.copyWith(desiredStyle: value) as $Val);
    });
  }

  /// Create a copy of CommissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OtherMattersCopyWith<$Res> get otherMatters {
    return $OtherMattersCopyWith<$Res>(_value.otherMatters, (value) {
      return _then(_value.copyWith(otherMatters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommissionRequestImplCopyWith<$Res>
    implements $CommissionRequestCopyWith<$Res> {
  factory _$$CommissionRequestImplCopyWith(_$CommissionRequestImpl value,
          $Res Function(_$CommissionRequestImpl) then) =
      __$$CommissionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int directorId,
      BasicInfo basicInfo,
      DesiredStyle desiredStyle,
      OtherMatters otherMatters});

  @override
  $BasicInfoCopyWith<$Res> get basicInfo;
  @override
  $DesiredStyleCopyWith<$Res> get desiredStyle;
  @override
  $OtherMattersCopyWith<$Res> get otherMatters;
}

/// @nodoc
class __$$CommissionRequestImplCopyWithImpl<$Res>
    extends _$CommissionRequestCopyWithImpl<$Res, _$CommissionRequestImpl>
    implements _$$CommissionRequestImplCopyWith<$Res> {
  __$$CommissionRequestImplCopyWithImpl(_$CommissionRequestImpl _value,
      $Res Function(_$CommissionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? directorId = null,
    Object? basicInfo = null,
    Object? desiredStyle = null,
    Object? otherMatters = null,
  }) {
    return _then(_$CommissionRequestImpl(
      directorId: null == directorId
          ? _value.directorId
          : directorId // ignore: cast_nullable_to_non_nullable
              as int,
      basicInfo: null == basicInfo
          ? _value.basicInfo
          : basicInfo // ignore: cast_nullable_to_non_nullable
              as BasicInfo,
      desiredStyle: null == desiredStyle
          ? _value.desiredStyle
          : desiredStyle // ignore: cast_nullable_to_non_nullable
              as DesiredStyle,
      otherMatters: null == otherMatters
          ? _value.otherMatters
          : otherMatters // ignore: cast_nullable_to_non_nullable
              as OtherMatters,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionRequestImpl implements _CommissionRequest {
  _$CommissionRequestImpl(
      {this.directorId = 0,
      required this.basicInfo,
      required this.desiredStyle,
      required this.otherMatters});

  factory _$CommissionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionRequestImplFromJson(json);

  @override
  @JsonKey()
  final int directorId;
  @override
  final BasicInfo basicInfo;
  @override
  final DesiredStyle desiredStyle;
  @override
  final OtherMatters otherMatters;

  @override
  String toString() {
    return 'CommissionRequest(directorId: $directorId, basicInfo: $basicInfo, desiredStyle: $desiredStyle, otherMatters: $otherMatters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionRequestImpl &&
            (identical(other.directorId, directorId) ||
                other.directorId == directorId) &&
            (identical(other.basicInfo, basicInfo) ||
                other.basicInfo == basicInfo) &&
            (identical(other.desiredStyle, desiredStyle) ||
                other.desiredStyle == desiredStyle) &&
            (identical(other.otherMatters, otherMatters) ||
                other.otherMatters == otherMatters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, directorId, basicInfo, desiredStyle, otherMatters);

  /// Create a copy of CommissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionRequestImplCopyWith<_$CommissionRequestImpl> get copyWith =>
      __$$CommissionRequestImplCopyWithImpl<_$CommissionRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionRequestImplToJson(
      this,
    );
  }
}

abstract class _CommissionRequest implements CommissionRequest {
  factory _CommissionRequest(
      {final int directorId,
      required final BasicInfo basicInfo,
      required final DesiredStyle desiredStyle,
      required final OtherMatters otherMatters}) = _$CommissionRequestImpl;

  factory _CommissionRequest.fromJson(Map<String, dynamic> json) =
      _$CommissionRequestImpl.fromJson;

  @override
  int get directorId;
  @override
  BasicInfo get basicInfo;
  @override
  DesiredStyle get desiredStyle;
  @override
  OtherMatters get otherMatters;

  /// Create a copy of CommissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionRequestImplCopyWith<_$CommissionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BasicInfo _$BasicInfoFromJson(Map<String, dynamic> json) {
  return _BasicInfo.fromJson(json);
}

/// @nodoc
mixin _$BasicInfo {
  int get height => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  String get topSize => throw _privateConstructorUsedError;
  String get bottomSize => throw _privateConstructorUsedError;
  int get postalCode => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get detailAddress => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  InfoStyle get infoStyle => throw _privateConstructorUsedError;
  InfoFit get infoFit => throw _privateConstructorUsedError;
  InfoMaterial get infoMaterial => throw _privateConstructorUsedError;
  InfoBodyType get infoBodyType => throw _privateConstructorUsedError;

  /// Serializes this BasicInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BasicInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasicInfoCopyWith<BasicInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicInfoCopyWith<$Res> {
  factory $BasicInfoCopyWith(BasicInfo value, $Res Function(BasicInfo) then) =
      _$BasicInfoCopyWithImpl<$Res, BasicInfo>;
  @useResult
  $Res call(
      {int height,
      int weight,
      String topSize,
      String bottomSize,
      int postalCode,
      String address,
      String detailAddress,
      String text,
      InfoStyle infoStyle,
      InfoFit infoFit,
      InfoMaterial infoMaterial,
      InfoBodyType infoBodyType});

  $InfoStyleCopyWith<$Res> get infoStyle;
  $InfoFitCopyWith<$Res> get infoFit;
  $InfoMaterialCopyWith<$Res> get infoMaterial;
  $InfoBodyTypeCopyWith<$Res> get infoBodyType;
}

/// @nodoc
class _$BasicInfoCopyWithImpl<$Res, $Val extends BasicInfo>
    implements $BasicInfoCopyWith<$Res> {
  _$BasicInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasicInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? weight = null,
    Object? topSize = null,
    Object? bottomSize = null,
    Object? postalCode = null,
    Object? address = null,
    Object? detailAddress = null,
    Object? text = null,
    Object? infoStyle = null,
    Object? infoFit = null,
    Object? infoMaterial = null,
    Object? infoBodyType = null,
  }) {
    return _then(_value.copyWith(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      topSize: null == topSize
          ? _value.topSize
          : topSize // ignore: cast_nullable_to_non_nullable
              as String,
      bottomSize: null == bottomSize
          ? _value.bottomSize
          : bottomSize // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      detailAddress: null == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      infoStyle: null == infoStyle
          ? _value.infoStyle
          : infoStyle // ignore: cast_nullable_to_non_nullable
              as InfoStyle,
      infoFit: null == infoFit
          ? _value.infoFit
          : infoFit // ignore: cast_nullable_to_non_nullable
              as InfoFit,
      infoMaterial: null == infoMaterial
          ? _value.infoMaterial
          : infoMaterial // ignore: cast_nullable_to_non_nullable
              as InfoMaterial,
      infoBodyType: null == infoBodyType
          ? _value.infoBodyType
          : infoBodyType // ignore: cast_nullable_to_non_nullable
              as InfoBodyType,
    ) as $Val);
  }

  /// Create a copy of BasicInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InfoStyleCopyWith<$Res> get infoStyle {
    return $InfoStyleCopyWith<$Res>(_value.infoStyle, (value) {
      return _then(_value.copyWith(infoStyle: value) as $Val);
    });
  }

  /// Create a copy of BasicInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InfoFitCopyWith<$Res> get infoFit {
    return $InfoFitCopyWith<$Res>(_value.infoFit, (value) {
      return _then(_value.copyWith(infoFit: value) as $Val);
    });
  }

  /// Create a copy of BasicInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InfoMaterialCopyWith<$Res> get infoMaterial {
    return $InfoMaterialCopyWith<$Res>(_value.infoMaterial, (value) {
      return _then(_value.copyWith(infoMaterial: value) as $Val);
    });
  }

  /// Create a copy of BasicInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InfoBodyTypeCopyWith<$Res> get infoBodyType {
    return $InfoBodyTypeCopyWith<$Res>(_value.infoBodyType, (value) {
      return _then(_value.copyWith(infoBodyType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BasicInfoImplCopyWith<$Res>
    implements $BasicInfoCopyWith<$Res> {
  factory _$$BasicInfoImplCopyWith(
          _$BasicInfoImpl value, $Res Function(_$BasicInfoImpl) then) =
      __$$BasicInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int height,
      int weight,
      String topSize,
      String bottomSize,
      int postalCode,
      String address,
      String detailAddress,
      String text,
      InfoStyle infoStyle,
      InfoFit infoFit,
      InfoMaterial infoMaterial,
      InfoBodyType infoBodyType});

  @override
  $InfoStyleCopyWith<$Res> get infoStyle;
  @override
  $InfoFitCopyWith<$Res> get infoFit;
  @override
  $InfoMaterialCopyWith<$Res> get infoMaterial;
  @override
  $InfoBodyTypeCopyWith<$Res> get infoBodyType;
}

/// @nodoc
class __$$BasicInfoImplCopyWithImpl<$Res>
    extends _$BasicInfoCopyWithImpl<$Res, _$BasicInfoImpl>
    implements _$$BasicInfoImplCopyWith<$Res> {
  __$$BasicInfoImplCopyWithImpl(
      _$BasicInfoImpl _value, $Res Function(_$BasicInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BasicInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? weight = null,
    Object? topSize = null,
    Object? bottomSize = null,
    Object? postalCode = null,
    Object? address = null,
    Object? detailAddress = null,
    Object? text = null,
    Object? infoStyle = null,
    Object? infoFit = null,
    Object? infoMaterial = null,
    Object? infoBodyType = null,
  }) {
    return _then(_$BasicInfoImpl(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      topSize: null == topSize
          ? _value.topSize
          : topSize // ignore: cast_nullable_to_non_nullable
              as String,
      bottomSize: null == bottomSize
          ? _value.bottomSize
          : bottomSize // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      detailAddress: null == detailAddress
          ? _value.detailAddress
          : detailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      infoStyle: null == infoStyle
          ? _value.infoStyle
          : infoStyle // ignore: cast_nullable_to_non_nullable
              as InfoStyle,
      infoFit: null == infoFit
          ? _value.infoFit
          : infoFit // ignore: cast_nullable_to_non_nullable
              as InfoFit,
      infoMaterial: null == infoMaterial
          ? _value.infoMaterial
          : infoMaterial // ignore: cast_nullable_to_non_nullable
              as InfoMaterial,
      infoBodyType: null == infoBodyType
          ? _value.infoBodyType
          : infoBodyType // ignore: cast_nullable_to_non_nullable
              as InfoBodyType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasicInfoImpl implements _BasicInfo {
  _$BasicInfoImpl(
      {required this.height,
      required this.weight,
      required this.topSize,
      required this.bottomSize,
      required this.postalCode,
      required this.address,
      required this.detailAddress,
      required this.text,
      required this.infoStyle,
      required this.infoFit,
      required this.infoMaterial,
      required this.infoBodyType});

  factory _$BasicInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasicInfoImplFromJson(json);

  @override
  final int height;
  @override
  final int weight;
  @override
  final String topSize;
  @override
  final String bottomSize;
  @override
  final int postalCode;
  @override
  final String address;
  @override
  final String detailAddress;
  @override
  final String text;
  @override
  final InfoStyle infoStyle;
  @override
  final InfoFit infoFit;
  @override
  final InfoMaterial infoMaterial;
  @override
  final InfoBodyType infoBodyType;

  @override
  String toString() {
    return 'BasicInfo(height: $height, weight: $weight, topSize: $topSize, bottomSize: $bottomSize, postalCode: $postalCode, address: $address, detailAddress: $detailAddress, text: $text, infoStyle: $infoStyle, infoFit: $infoFit, infoMaterial: $infoMaterial, infoBodyType: $infoBodyType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicInfoImpl &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.topSize, topSize) || other.topSize == topSize) &&
            (identical(other.bottomSize, bottomSize) ||
                other.bottomSize == bottomSize) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.detailAddress, detailAddress) ||
                other.detailAddress == detailAddress) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.infoStyle, infoStyle) ||
                other.infoStyle == infoStyle) &&
            (identical(other.infoFit, infoFit) || other.infoFit == infoFit) &&
            (identical(other.infoMaterial, infoMaterial) ||
                other.infoMaterial == infoMaterial) &&
            (identical(other.infoBodyType, infoBodyType) ||
                other.infoBodyType == infoBodyType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      height,
      weight,
      topSize,
      bottomSize,
      postalCode,
      address,
      detailAddress,
      text,
      infoStyle,
      infoFit,
      infoMaterial,
      infoBodyType);

  /// Create a copy of BasicInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicInfoImplCopyWith<_$BasicInfoImpl> get copyWith =>
      __$$BasicInfoImplCopyWithImpl<_$BasicInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasicInfoImplToJson(
      this,
    );
  }
}

abstract class _BasicInfo implements BasicInfo {
  factory _BasicInfo(
      {required final int height,
      required final int weight,
      required final String topSize,
      required final String bottomSize,
      required final int postalCode,
      required final String address,
      required final String detailAddress,
      required final String text,
      required final InfoStyle infoStyle,
      required final InfoFit infoFit,
      required final InfoMaterial infoMaterial,
      required final InfoBodyType infoBodyType}) = _$BasicInfoImpl;

  factory _BasicInfo.fromJson(Map<String, dynamic> json) =
      _$BasicInfoImpl.fromJson;

  @override
  int get height;
  @override
  int get weight;
  @override
  String get topSize;
  @override
  String get bottomSize;
  @override
  int get postalCode;
  @override
  String get address;
  @override
  String get detailAddress;
  @override
  String get text;
  @override
  InfoStyle get infoStyle;
  @override
  InfoFit get infoFit;
  @override
  InfoMaterial get infoMaterial;
  @override
  InfoBodyType get infoBodyType;

  /// Create a copy of BasicInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasicInfoImplCopyWith<_$BasicInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InfoStyle _$InfoStyleFromJson(Map<String, dynamic> json) {
  return _InfoStyle.fromJson(json);
}

/// @nodoc
mixin _$InfoStyle {
  List<String> get preferredStyleList => throw _privateConstructorUsedError;
  List<String> get nonPreferredStyleList => throw _privateConstructorUsedError;

  /// Serializes this InfoStyle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InfoStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfoStyleCopyWith<InfoStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoStyleCopyWith<$Res> {
  factory $InfoStyleCopyWith(InfoStyle value, $Res Function(InfoStyle) then) =
      _$InfoStyleCopyWithImpl<$Res, InfoStyle>;
  @useResult
  $Res call(
      {List<String> preferredStyleList, List<String> nonPreferredStyleList});
}

/// @nodoc
class _$InfoStyleCopyWithImpl<$Res, $Val extends InfoStyle>
    implements $InfoStyleCopyWith<$Res> {
  _$InfoStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfoStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredStyleList = null,
    Object? nonPreferredStyleList = null,
  }) {
    return _then(_value.copyWith(
      preferredStyleList: null == preferredStyleList
          ? _value.preferredStyleList
          : preferredStyleList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nonPreferredStyleList: null == nonPreferredStyleList
          ? _value.nonPreferredStyleList
          : nonPreferredStyleList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InfoStyleImplCopyWith<$Res>
    implements $InfoStyleCopyWith<$Res> {
  factory _$$InfoStyleImplCopyWith(
          _$InfoStyleImpl value, $Res Function(_$InfoStyleImpl) then) =
      __$$InfoStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> preferredStyleList, List<String> nonPreferredStyleList});
}

/// @nodoc
class __$$InfoStyleImplCopyWithImpl<$Res>
    extends _$InfoStyleCopyWithImpl<$Res, _$InfoStyleImpl>
    implements _$$InfoStyleImplCopyWith<$Res> {
  __$$InfoStyleImplCopyWithImpl(
      _$InfoStyleImpl _value, $Res Function(_$InfoStyleImpl) _then)
      : super(_value, _then);

  /// Create a copy of InfoStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredStyleList = null,
    Object? nonPreferredStyleList = null,
  }) {
    return _then(_$InfoStyleImpl(
      preferredStyleList: null == preferredStyleList
          ? _value._preferredStyleList
          : preferredStyleList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nonPreferredStyleList: null == nonPreferredStyleList
          ? _value._nonPreferredStyleList
          : nonPreferredStyleList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfoStyleImpl implements _InfoStyle {
  _$InfoStyleImpl(
      {final List<String> preferredStyleList = const [],
      final List<String> nonPreferredStyleList = const []})
      : _preferredStyleList = preferredStyleList,
        _nonPreferredStyleList = nonPreferredStyleList;

  factory _$InfoStyleImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoStyleImplFromJson(json);

  final List<String> _preferredStyleList;
  @override
  @JsonKey()
  List<String> get preferredStyleList {
    if (_preferredStyleList is EqualUnmodifiableListView)
      return _preferredStyleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredStyleList);
  }

  final List<String> _nonPreferredStyleList;
  @override
  @JsonKey()
  List<String> get nonPreferredStyleList {
    if (_nonPreferredStyleList is EqualUnmodifiableListView)
      return _nonPreferredStyleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nonPreferredStyleList);
  }

  @override
  String toString() {
    return 'InfoStyle(preferredStyleList: $preferredStyleList, nonPreferredStyleList: $nonPreferredStyleList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoStyleImpl &&
            const DeepCollectionEquality()
                .equals(other._preferredStyleList, _preferredStyleList) &&
            const DeepCollectionEquality()
                .equals(other._nonPreferredStyleList, _nonPreferredStyleList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_preferredStyleList),
      const DeepCollectionEquality().hash(_nonPreferredStyleList));

  /// Create a copy of InfoStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoStyleImplCopyWith<_$InfoStyleImpl> get copyWith =>
      __$$InfoStyleImplCopyWithImpl<_$InfoStyleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfoStyleImplToJson(
      this,
    );
  }
}

abstract class _InfoStyle implements InfoStyle {
  factory _InfoStyle(
      {final List<String> preferredStyleList,
      final List<String> nonPreferredStyleList}) = _$InfoStyleImpl;

  factory _InfoStyle.fromJson(Map<String, dynamic> json) =
      _$InfoStyleImpl.fromJson;

  @override
  List<String> get preferredStyleList;
  @override
  List<String> get nonPreferredStyleList;

  /// Create a copy of InfoStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfoStyleImplCopyWith<_$InfoStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InfoFit _$InfoFitFromJson(Map<String, dynamic> json) {
  return _InfoFit.fromJson(json);
}

/// @nodoc
mixin _$InfoFit {
  List<String> get preferredFitList => throw _privateConstructorUsedError;
  List<String> get nonPreferredFitList => throw _privateConstructorUsedError;

  /// Serializes this InfoFit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InfoFit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfoFitCopyWith<InfoFit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoFitCopyWith<$Res> {
  factory $InfoFitCopyWith(InfoFit value, $Res Function(InfoFit) then) =
      _$InfoFitCopyWithImpl<$Res, InfoFit>;
  @useResult
  $Res call({List<String> preferredFitList, List<String> nonPreferredFitList});
}

/// @nodoc
class _$InfoFitCopyWithImpl<$Res, $Val extends InfoFit>
    implements $InfoFitCopyWith<$Res> {
  _$InfoFitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfoFit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredFitList = null,
    Object? nonPreferredFitList = null,
  }) {
    return _then(_value.copyWith(
      preferredFitList: null == preferredFitList
          ? _value.preferredFitList
          : preferredFitList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nonPreferredFitList: null == nonPreferredFitList
          ? _value.nonPreferredFitList
          : nonPreferredFitList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InfoFitImplCopyWith<$Res> implements $InfoFitCopyWith<$Res> {
  factory _$$InfoFitImplCopyWith(
          _$InfoFitImpl value, $Res Function(_$InfoFitImpl) then) =
      __$$InfoFitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> preferredFitList, List<String> nonPreferredFitList});
}

/// @nodoc
class __$$InfoFitImplCopyWithImpl<$Res>
    extends _$InfoFitCopyWithImpl<$Res, _$InfoFitImpl>
    implements _$$InfoFitImplCopyWith<$Res> {
  __$$InfoFitImplCopyWithImpl(
      _$InfoFitImpl _value, $Res Function(_$InfoFitImpl) _then)
      : super(_value, _then);

  /// Create a copy of InfoFit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredFitList = null,
    Object? nonPreferredFitList = null,
  }) {
    return _then(_$InfoFitImpl(
      preferredFitList: null == preferredFitList
          ? _value._preferredFitList
          : preferredFitList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nonPreferredFitList: null == nonPreferredFitList
          ? _value._nonPreferredFitList
          : nonPreferredFitList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfoFitImpl implements _InfoFit {
  _$InfoFitImpl(
      {final List<String> preferredFitList = const [],
      final List<String> nonPreferredFitList = const []})
      : _preferredFitList = preferredFitList,
        _nonPreferredFitList = nonPreferredFitList;

  factory _$InfoFitImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoFitImplFromJson(json);

  final List<String> _preferredFitList;
  @override
  @JsonKey()
  List<String> get preferredFitList {
    if (_preferredFitList is EqualUnmodifiableListView)
      return _preferredFitList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredFitList);
  }

  final List<String> _nonPreferredFitList;
  @override
  @JsonKey()
  List<String> get nonPreferredFitList {
    if (_nonPreferredFitList is EqualUnmodifiableListView)
      return _nonPreferredFitList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nonPreferredFitList);
  }

  @override
  String toString() {
    return 'InfoFit(preferredFitList: $preferredFitList, nonPreferredFitList: $nonPreferredFitList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoFitImpl &&
            const DeepCollectionEquality()
                .equals(other._preferredFitList, _preferredFitList) &&
            const DeepCollectionEquality()
                .equals(other._nonPreferredFitList, _nonPreferredFitList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_preferredFitList),
      const DeepCollectionEquality().hash(_nonPreferredFitList));

  /// Create a copy of InfoFit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoFitImplCopyWith<_$InfoFitImpl> get copyWith =>
      __$$InfoFitImplCopyWithImpl<_$InfoFitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfoFitImplToJson(
      this,
    );
  }
}

abstract class _InfoFit implements InfoFit {
  factory _InfoFit(
      {final List<String> preferredFitList,
      final List<String> nonPreferredFitList}) = _$InfoFitImpl;

  factory _InfoFit.fromJson(Map<String, dynamic> json) = _$InfoFitImpl.fromJson;

  @override
  List<String> get preferredFitList;
  @override
  List<String> get nonPreferredFitList;

  /// Create a copy of InfoFit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfoFitImplCopyWith<_$InfoFitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InfoMaterial _$InfoMaterialFromJson(Map<String, dynamic> json) {
  return _InfoMaterial.fromJson(json);
}

/// @nodoc
mixin _$InfoMaterial {
  List<String> get preferredMaterialList => throw _privateConstructorUsedError;
  List<String> get nonPreferredMaterialList =>
      throw _privateConstructorUsedError;

  /// Serializes this InfoMaterial to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InfoMaterial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfoMaterialCopyWith<InfoMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoMaterialCopyWith<$Res> {
  factory $InfoMaterialCopyWith(
          InfoMaterial value, $Res Function(InfoMaterial) then) =
      _$InfoMaterialCopyWithImpl<$Res, InfoMaterial>;
  @useResult
  $Res call(
      {List<String> preferredMaterialList,
      List<String> nonPreferredMaterialList});
}

/// @nodoc
class _$InfoMaterialCopyWithImpl<$Res, $Val extends InfoMaterial>
    implements $InfoMaterialCopyWith<$Res> {
  _$InfoMaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfoMaterial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredMaterialList = null,
    Object? nonPreferredMaterialList = null,
  }) {
    return _then(_value.copyWith(
      preferredMaterialList: null == preferredMaterialList
          ? _value.preferredMaterialList
          : preferredMaterialList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nonPreferredMaterialList: null == nonPreferredMaterialList
          ? _value.nonPreferredMaterialList
          : nonPreferredMaterialList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InfoMaterialImplCopyWith<$Res>
    implements $InfoMaterialCopyWith<$Res> {
  factory _$$InfoMaterialImplCopyWith(
          _$InfoMaterialImpl value, $Res Function(_$InfoMaterialImpl) then) =
      __$$InfoMaterialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> preferredMaterialList,
      List<String> nonPreferredMaterialList});
}

/// @nodoc
class __$$InfoMaterialImplCopyWithImpl<$Res>
    extends _$InfoMaterialCopyWithImpl<$Res, _$InfoMaterialImpl>
    implements _$$InfoMaterialImplCopyWith<$Res> {
  __$$InfoMaterialImplCopyWithImpl(
      _$InfoMaterialImpl _value, $Res Function(_$InfoMaterialImpl) _then)
      : super(_value, _then);

  /// Create a copy of InfoMaterial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferredMaterialList = null,
    Object? nonPreferredMaterialList = null,
  }) {
    return _then(_$InfoMaterialImpl(
      preferredMaterialList: null == preferredMaterialList
          ? _value._preferredMaterialList
          : preferredMaterialList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nonPreferredMaterialList: null == nonPreferredMaterialList
          ? _value._nonPreferredMaterialList
          : nonPreferredMaterialList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfoMaterialImpl implements _InfoMaterial {
  _$InfoMaterialImpl(
      {final List<String> preferredMaterialList = const [],
      final List<String> nonPreferredMaterialList = const []})
      : _preferredMaterialList = preferredMaterialList,
        _nonPreferredMaterialList = nonPreferredMaterialList;

  factory _$InfoMaterialImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoMaterialImplFromJson(json);

  final List<String> _preferredMaterialList;
  @override
  @JsonKey()
  List<String> get preferredMaterialList {
    if (_preferredMaterialList is EqualUnmodifiableListView)
      return _preferredMaterialList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredMaterialList);
  }

  final List<String> _nonPreferredMaterialList;
  @override
  @JsonKey()
  List<String> get nonPreferredMaterialList {
    if (_nonPreferredMaterialList is EqualUnmodifiableListView)
      return _nonPreferredMaterialList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nonPreferredMaterialList);
  }

  @override
  String toString() {
    return 'InfoMaterial(preferredMaterialList: $preferredMaterialList, nonPreferredMaterialList: $nonPreferredMaterialList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoMaterialImpl &&
            const DeepCollectionEquality()
                .equals(other._preferredMaterialList, _preferredMaterialList) &&
            const DeepCollectionEquality().equals(
                other._nonPreferredMaterialList, _nonPreferredMaterialList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_preferredMaterialList),
      const DeepCollectionEquality().hash(_nonPreferredMaterialList));

  /// Create a copy of InfoMaterial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoMaterialImplCopyWith<_$InfoMaterialImpl> get copyWith =>
      __$$InfoMaterialImplCopyWithImpl<_$InfoMaterialImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfoMaterialImplToJson(
      this,
    );
  }
}

abstract class _InfoMaterial implements InfoMaterial {
  factory _InfoMaterial(
      {final List<String> preferredMaterialList,
      final List<String> nonPreferredMaterialList}) = _$InfoMaterialImpl;

  factory _InfoMaterial.fromJson(Map<String, dynamic> json) =
      _$InfoMaterialImpl.fromJson;

  @override
  List<String> get preferredMaterialList;
  @override
  List<String> get nonPreferredMaterialList;

  /// Create a copy of InfoMaterial
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfoMaterialImplCopyWith<_$InfoMaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InfoBodyType _$InfoBodyTypeFromJson(Map<String, dynamic> json) {
  return _InfoBodyType.fromJson(json);
}

/// @nodoc
mixin _$InfoBodyType {
  List<String> get goodBodyTypeList => throw _privateConstructorUsedError;
  List<String> get badBodyTypeList => throw _privateConstructorUsedError;

  /// Serializes this InfoBodyType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InfoBodyType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfoBodyTypeCopyWith<InfoBodyType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoBodyTypeCopyWith<$Res> {
  factory $InfoBodyTypeCopyWith(
          InfoBodyType value, $Res Function(InfoBodyType) then) =
      _$InfoBodyTypeCopyWithImpl<$Res, InfoBodyType>;
  @useResult
  $Res call({List<String> goodBodyTypeList, List<String> badBodyTypeList});
}

/// @nodoc
class _$InfoBodyTypeCopyWithImpl<$Res, $Val extends InfoBodyType>
    implements $InfoBodyTypeCopyWith<$Res> {
  _$InfoBodyTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfoBodyType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goodBodyTypeList = null,
    Object? badBodyTypeList = null,
  }) {
    return _then(_value.copyWith(
      goodBodyTypeList: null == goodBodyTypeList
          ? _value.goodBodyTypeList
          : goodBodyTypeList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      badBodyTypeList: null == badBodyTypeList
          ? _value.badBodyTypeList
          : badBodyTypeList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InfoBodyTypeImplCopyWith<$Res>
    implements $InfoBodyTypeCopyWith<$Res> {
  factory _$$InfoBodyTypeImplCopyWith(
          _$InfoBodyTypeImpl value, $Res Function(_$InfoBodyTypeImpl) then) =
      __$$InfoBodyTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> goodBodyTypeList, List<String> badBodyTypeList});
}

/// @nodoc
class __$$InfoBodyTypeImplCopyWithImpl<$Res>
    extends _$InfoBodyTypeCopyWithImpl<$Res, _$InfoBodyTypeImpl>
    implements _$$InfoBodyTypeImplCopyWith<$Res> {
  __$$InfoBodyTypeImplCopyWithImpl(
      _$InfoBodyTypeImpl _value, $Res Function(_$InfoBodyTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of InfoBodyType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goodBodyTypeList = null,
    Object? badBodyTypeList = null,
  }) {
    return _then(_$InfoBodyTypeImpl(
      goodBodyTypeList: null == goodBodyTypeList
          ? _value._goodBodyTypeList
          : goodBodyTypeList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      badBodyTypeList: null == badBodyTypeList
          ? _value._badBodyTypeList
          : badBodyTypeList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfoBodyTypeImpl implements _InfoBodyType {
  _$InfoBodyTypeImpl(
      {final List<String> goodBodyTypeList = const [],
      final List<String> badBodyTypeList = const []})
      : _goodBodyTypeList = goodBodyTypeList,
        _badBodyTypeList = badBodyTypeList;

  factory _$InfoBodyTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoBodyTypeImplFromJson(json);

  final List<String> _goodBodyTypeList;
  @override
  @JsonKey()
  List<String> get goodBodyTypeList {
    if (_goodBodyTypeList is EqualUnmodifiableListView)
      return _goodBodyTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goodBodyTypeList);
  }

  final List<String> _badBodyTypeList;
  @override
  @JsonKey()
  List<String> get badBodyTypeList {
    if (_badBodyTypeList is EqualUnmodifiableListView) return _badBodyTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badBodyTypeList);
  }

  @override
  String toString() {
    return 'InfoBodyType(goodBodyTypeList: $goodBodyTypeList, badBodyTypeList: $badBodyTypeList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoBodyTypeImpl &&
            const DeepCollectionEquality()
                .equals(other._goodBodyTypeList, _goodBodyTypeList) &&
            const DeepCollectionEquality()
                .equals(other._badBodyTypeList, _badBodyTypeList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_goodBodyTypeList),
      const DeepCollectionEquality().hash(_badBodyTypeList));

  /// Create a copy of InfoBodyType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoBodyTypeImplCopyWith<_$InfoBodyTypeImpl> get copyWith =>
      __$$InfoBodyTypeImplCopyWithImpl<_$InfoBodyTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfoBodyTypeImplToJson(
      this,
    );
  }
}

abstract class _InfoBodyType implements InfoBodyType {
  factory _InfoBodyType(
      {final List<String> goodBodyTypeList,
      final List<String> badBodyTypeList}) = _$InfoBodyTypeImpl;

  factory _InfoBodyType.fromJson(Map<String, dynamic> json) =
      _$InfoBodyTypeImpl.fromJson;

  @override
  List<String> get goodBodyTypeList;
  @override
  List<String> get badBodyTypeList;

  /// Create a copy of InfoBodyType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfoBodyTypeImplCopyWith<_$InfoBodyTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DesiredStyle _$DesiredStyleFromJson(Map<String, dynamic> json) {
  return _DesiredStyle.fromJson(json);
}

/// @nodoc
mixin _$DesiredStyle {
  String get occasion => throw _privateConstructorUsedError;
  StyleList get styleList => throw _privateConstructorUsedError;
  FitList get fitList => throw _privateConstructorUsedError;
  MaterialList get materialList => throw _privateConstructorUsedError;
  ColorList get colorList => throw _privateConstructorUsedError;

  /// Serializes this DesiredStyle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DesiredStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DesiredStyleCopyWith<DesiredStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesiredStyleCopyWith<$Res> {
  factory $DesiredStyleCopyWith(
          DesiredStyle value, $Res Function(DesiredStyle) then) =
      _$DesiredStyleCopyWithImpl<$Res, DesiredStyle>;
  @useResult
  $Res call(
      {String occasion,
      StyleList styleList,
      FitList fitList,
      MaterialList materialList,
      ColorList colorList});

  $StyleListCopyWith<$Res> get styleList;
  $FitListCopyWith<$Res> get fitList;
  $MaterialListCopyWith<$Res> get materialList;
  $ColorListCopyWith<$Res> get colorList;
}

/// @nodoc
class _$DesiredStyleCopyWithImpl<$Res, $Val extends DesiredStyle>
    implements $DesiredStyleCopyWith<$Res> {
  _$DesiredStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DesiredStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? occasion = null,
    Object? styleList = null,
    Object? fitList = null,
    Object? materialList = null,
    Object? colorList = null,
  }) {
    return _then(_value.copyWith(
      occasion: null == occasion
          ? _value.occasion
          : occasion // ignore: cast_nullable_to_non_nullable
              as String,
      styleList: null == styleList
          ? _value.styleList
          : styleList // ignore: cast_nullable_to_non_nullable
              as StyleList,
      fitList: null == fitList
          ? _value.fitList
          : fitList // ignore: cast_nullable_to_non_nullable
              as FitList,
      materialList: null == materialList
          ? _value.materialList
          : materialList // ignore: cast_nullable_to_non_nullable
              as MaterialList,
      colorList: null == colorList
          ? _value.colorList
          : colorList // ignore: cast_nullable_to_non_nullable
              as ColorList,
    ) as $Val);
  }

  /// Create a copy of DesiredStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StyleListCopyWith<$Res> get styleList {
    return $StyleListCopyWith<$Res>(_value.styleList, (value) {
      return _then(_value.copyWith(styleList: value) as $Val);
    });
  }

  /// Create a copy of DesiredStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FitListCopyWith<$Res> get fitList {
    return $FitListCopyWith<$Res>(_value.fitList, (value) {
      return _then(_value.copyWith(fitList: value) as $Val);
    });
  }

  /// Create a copy of DesiredStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialListCopyWith<$Res> get materialList {
    return $MaterialListCopyWith<$Res>(_value.materialList, (value) {
      return _then(_value.copyWith(materialList: value) as $Val);
    });
  }

  /// Create a copy of DesiredStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ColorListCopyWith<$Res> get colorList {
    return $ColorListCopyWith<$Res>(_value.colorList, (value) {
      return _then(_value.copyWith(colorList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DesiredStyleImplCopyWith<$Res>
    implements $DesiredStyleCopyWith<$Res> {
  factory _$$DesiredStyleImplCopyWith(
          _$DesiredStyleImpl value, $Res Function(_$DesiredStyleImpl) then) =
      __$$DesiredStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String occasion,
      StyleList styleList,
      FitList fitList,
      MaterialList materialList,
      ColorList colorList});

  @override
  $StyleListCopyWith<$Res> get styleList;
  @override
  $FitListCopyWith<$Res> get fitList;
  @override
  $MaterialListCopyWith<$Res> get materialList;
  @override
  $ColorListCopyWith<$Res> get colorList;
}

/// @nodoc
class __$$DesiredStyleImplCopyWithImpl<$Res>
    extends _$DesiredStyleCopyWithImpl<$Res, _$DesiredStyleImpl>
    implements _$$DesiredStyleImplCopyWith<$Res> {
  __$$DesiredStyleImplCopyWithImpl(
      _$DesiredStyleImpl _value, $Res Function(_$DesiredStyleImpl) _then)
      : super(_value, _then);

  /// Create a copy of DesiredStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? occasion = null,
    Object? styleList = null,
    Object? fitList = null,
    Object? materialList = null,
    Object? colorList = null,
  }) {
    return _then(_$DesiredStyleImpl(
      occasion: null == occasion
          ? _value.occasion
          : occasion // ignore: cast_nullable_to_non_nullable
              as String,
      styleList: null == styleList
          ? _value.styleList
          : styleList // ignore: cast_nullable_to_non_nullable
              as StyleList,
      fitList: null == fitList
          ? _value.fitList
          : fitList // ignore: cast_nullable_to_non_nullable
              as FitList,
      materialList: null == materialList
          ? _value.materialList
          : materialList // ignore: cast_nullable_to_non_nullable
              as MaterialList,
      colorList: null == colorList
          ? _value.colorList
          : colorList // ignore: cast_nullable_to_non_nullable
              as ColorList,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DesiredStyleImpl implements _DesiredStyle {
  _$DesiredStyleImpl(
      {required this.occasion,
      required this.styleList,
      required this.fitList,
      required this.materialList,
      required this.colorList});

  factory _$DesiredStyleImpl.fromJson(Map<String, dynamic> json) =>
      _$$DesiredStyleImplFromJson(json);

  @override
  final String occasion;
  @override
  final StyleList styleList;
  @override
  final FitList fitList;
  @override
  final MaterialList materialList;
  @override
  final ColorList colorList;

  @override
  String toString() {
    return 'DesiredStyle(occasion: $occasion, styleList: $styleList, fitList: $fitList, materialList: $materialList, colorList: $colorList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DesiredStyleImpl &&
            (identical(other.occasion, occasion) ||
                other.occasion == occasion) &&
            (identical(other.styleList, styleList) ||
                other.styleList == styleList) &&
            (identical(other.fitList, fitList) || other.fitList == fitList) &&
            (identical(other.materialList, materialList) ||
                other.materialList == materialList) &&
            (identical(other.colorList, colorList) ||
                other.colorList == colorList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, occasion, styleList, fitList, materialList, colorList);

  /// Create a copy of DesiredStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DesiredStyleImplCopyWith<_$DesiredStyleImpl> get copyWith =>
      __$$DesiredStyleImplCopyWithImpl<_$DesiredStyleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DesiredStyleImplToJson(
      this,
    );
  }
}

abstract class _DesiredStyle implements DesiredStyle {
  factory _DesiredStyle(
      {required final String occasion,
      required final StyleList styleList,
      required final FitList fitList,
      required final MaterialList materialList,
      required final ColorList colorList}) = _$DesiredStyleImpl;

  factory _DesiredStyle.fromJson(Map<String, dynamic> json) =
      _$DesiredStyleImpl.fromJson;

  @override
  String get occasion;
  @override
  StyleList get styleList;
  @override
  FitList get fitList;
  @override
  MaterialList get materialList;
  @override
  ColorList get colorList;

  /// Create a copy of DesiredStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DesiredStyleImplCopyWith<_$DesiredStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StyleList _$StyleListFromJson(Map<String, dynamic> json) {
  return _StyleList.fromJson(json);
}

/// @nodoc
mixin _$StyleList {
  List<String> get styleList => throw _privateConstructorUsedError;

  /// Serializes this StyleList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StyleList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StyleListCopyWith<StyleList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StyleListCopyWith<$Res> {
  factory $StyleListCopyWith(StyleList value, $Res Function(StyleList) then) =
      _$StyleListCopyWithImpl<$Res, StyleList>;
  @useResult
  $Res call({List<String> styleList});
}

/// @nodoc
class _$StyleListCopyWithImpl<$Res, $Val extends StyleList>
    implements $StyleListCopyWith<$Res> {
  _$StyleListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StyleList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? styleList = null,
  }) {
    return _then(_value.copyWith(
      styleList: null == styleList
          ? _value.styleList
          : styleList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StyleListImplCopyWith<$Res>
    implements $StyleListCopyWith<$Res> {
  factory _$$StyleListImplCopyWith(
          _$StyleListImpl value, $Res Function(_$StyleListImpl) then) =
      __$$StyleListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> styleList});
}

/// @nodoc
class __$$StyleListImplCopyWithImpl<$Res>
    extends _$StyleListCopyWithImpl<$Res, _$StyleListImpl>
    implements _$$StyleListImplCopyWith<$Res> {
  __$$StyleListImplCopyWithImpl(
      _$StyleListImpl _value, $Res Function(_$StyleListImpl) _then)
      : super(_value, _then);

  /// Create a copy of StyleList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? styleList = null,
  }) {
    return _then(_$StyleListImpl(
      styleList: null == styleList
          ? _value._styleList
          : styleList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StyleListImpl implements _StyleList {
  _$StyleListImpl({required final List<String> styleList})
      : _styleList = styleList;

  factory _$StyleListImpl.fromJson(Map<String, dynamic> json) =>
      _$$StyleListImplFromJson(json);

  final List<String> _styleList;
  @override
  List<String> get styleList {
    if (_styleList is EqualUnmodifiableListView) return _styleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_styleList);
  }

  @override
  String toString() {
    return 'StyleList(styleList: $styleList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StyleListImpl &&
            const DeepCollectionEquality()
                .equals(other._styleList, _styleList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_styleList));

  /// Create a copy of StyleList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StyleListImplCopyWith<_$StyleListImpl> get copyWith =>
      __$$StyleListImplCopyWithImpl<_$StyleListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StyleListImplToJson(
      this,
    );
  }
}

abstract class _StyleList implements StyleList {
  factory _StyleList({required final List<String> styleList}) = _$StyleListImpl;

  factory _StyleList.fromJson(Map<String, dynamic> json) =
      _$StyleListImpl.fromJson;

  @override
  List<String> get styleList;

  /// Create a copy of StyleList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StyleListImplCopyWith<_$StyleListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FitList _$FitListFromJson(Map<String, dynamic> json) {
  return _FitList.fromJson(json);
}

/// @nodoc
mixin _$FitList {
  List<String> get fitList => throw _privateConstructorUsedError;

  /// Serializes this FitList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FitList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FitListCopyWith<FitList> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FitListCopyWith<$Res> {
  factory $FitListCopyWith(FitList value, $Res Function(FitList) then) =
      _$FitListCopyWithImpl<$Res, FitList>;
  @useResult
  $Res call({List<String> fitList});
}

/// @nodoc
class _$FitListCopyWithImpl<$Res, $Val extends FitList>
    implements $FitListCopyWith<$Res> {
  _$FitListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FitList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fitList = null,
  }) {
    return _then(_value.copyWith(
      fitList: null == fitList
          ? _value.fitList
          : fitList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FitListImplCopyWith<$Res> implements $FitListCopyWith<$Res> {
  factory _$$FitListImplCopyWith(
          _$FitListImpl value, $Res Function(_$FitListImpl) then) =
      __$$FitListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> fitList});
}

/// @nodoc
class __$$FitListImplCopyWithImpl<$Res>
    extends _$FitListCopyWithImpl<$Res, _$FitListImpl>
    implements _$$FitListImplCopyWith<$Res> {
  __$$FitListImplCopyWithImpl(
      _$FitListImpl _value, $Res Function(_$FitListImpl) _then)
      : super(_value, _then);

  /// Create a copy of FitList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fitList = null,
  }) {
    return _then(_$FitListImpl(
      fitList: null == fitList
          ? _value._fitList
          : fitList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FitListImpl implements _FitList {
  _$FitListImpl({required final List<String> fitList}) : _fitList = fitList;

  factory _$FitListImpl.fromJson(Map<String, dynamic> json) =>
      _$$FitListImplFromJson(json);

  final List<String> _fitList;
  @override
  List<String> get fitList {
    if (_fitList is EqualUnmodifiableListView) return _fitList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fitList);
  }

  @override
  String toString() {
    return 'FitList(fitList: $fitList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FitListImpl &&
            const DeepCollectionEquality().equals(other._fitList, _fitList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_fitList));

  /// Create a copy of FitList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FitListImplCopyWith<_$FitListImpl> get copyWith =>
      __$$FitListImplCopyWithImpl<_$FitListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FitListImplToJson(
      this,
    );
  }
}

abstract class _FitList implements FitList {
  factory _FitList({required final List<String> fitList}) = _$FitListImpl;

  factory _FitList.fromJson(Map<String, dynamic> json) = _$FitListImpl.fromJson;

  @override
  List<String> get fitList;

  /// Create a copy of FitList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FitListImplCopyWith<_$FitListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MaterialList _$MaterialListFromJson(Map<String, dynamic> json) {
  return _MaterialList.fromJson(json);
}

/// @nodoc
mixin _$MaterialList {
  List<String> get materialList => throw _privateConstructorUsedError;

  /// Serializes this MaterialList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialListCopyWith<MaterialList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialListCopyWith<$Res> {
  factory $MaterialListCopyWith(
          MaterialList value, $Res Function(MaterialList) then) =
      _$MaterialListCopyWithImpl<$Res, MaterialList>;
  @useResult
  $Res call({List<String> materialList});
}

/// @nodoc
class _$MaterialListCopyWithImpl<$Res, $Val extends MaterialList>
    implements $MaterialListCopyWith<$Res> {
  _$MaterialListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialList = null,
  }) {
    return _then(_value.copyWith(
      materialList: null == materialList
          ? _value.materialList
          : materialList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialListImplCopyWith<$Res>
    implements $MaterialListCopyWith<$Res> {
  factory _$$MaterialListImplCopyWith(
          _$MaterialListImpl value, $Res Function(_$MaterialListImpl) then) =
      __$$MaterialListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> materialList});
}

/// @nodoc
class __$$MaterialListImplCopyWithImpl<$Res>
    extends _$MaterialListCopyWithImpl<$Res, _$MaterialListImpl>
    implements _$$MaterialListImplCopyWith<$Res> {
  __$$MaterialListImplCopyWithImpl(
      _$MaterialListImpl _value, $Res Function(_$MaterialListImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialList = null,
  }) {
    return _then(_$MaterialListImpl(
      materialList: null == materialList
          ? _value._materialList
          : materialList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialListImpl implements _MaterialList {
  _$MaterialListImpl({required final List<String> materialList})
      : _materialList = materialList;

  factory _$MaterialListImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialListImplFromJson(json);

  final List<String> _materialList;
  @override
  List<String> get materialList {
    if (_materialList is EqualUnmodifiableListView) return _materialList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialList);
  }

  @override
  String toString() {
    return 'MaterialList(materialList: $materialList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialListImpl &&
            const DeepCollectionEquality()
                .equals(other._materialList, _materialList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_materialList));

  /// Create a copy of MaterialList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialListImplCopyWith<_$MaterialListImpl> get copyWith =>
      __$$MaterialListImplCopyWithImpl<_$MaterialListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialListImplToJson(
      this,
    );
  }
}

abstract class _MaterialList implements MaterialList {
  factory _MaterialList({required final List<String> materialList}) =
      _$MaterialListImpl;

  factory _MaterialList.fromJson(Map<String, dynamic> json) =
      _$MaterialListImpl.fromJson;

  @override
  List<String> get materialList;

  /// Create a copy of MaterialList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialListImplCopyWith<_$MaterialListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ColorList _$ColorListFromJson(Map<String, dynamic> json) {
  return _ColorList.fromJson(json);
}

/// @nodoc
mixin _$ColorList {
  List<String> get colorList => throw _privateConstructorUsedError;

  /// Serializes this ColorList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ColorList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorListCopyWith<ColorList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorListCopyWith<$Res> {
  factory $ColorListCopyWith(ColorList value, $Res Function(ColorList) then) =
      _$ColorListCopyWithImpl<$Res, ColorList>;
  @useResult
  $Res call({List<String> colorList});
}

/// @nodoc
class _$ColorListCopyWithImpl<$Res, $Val extends ColorList>
    implements $ColorListCopyWith<$Res> {
  _$ColorListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorList = null,
  }) {
    return _then(_value.copyWith(
      colorList: null == colorList
          ? _value.colorList
          : colorList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ColorListImplCopyWith<$Res>
    implements $ColorListCopyWith<$Res> {
  factory _$$ColorListImplCopyWith(
          _$ColorListImpl value, $Res Function(_$ColorListImpl) then) =
      __$$ColorListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> colorList});
}

/// @nodoc
class __$$ColorListImplCopyWithImpl<$Res>
    extends _$ColorListCopyWithImpl<$Res, _$ColorListImpl>
    implements _$$ColorListImplCopyWith<$Res> {
  __$$ColorListImplCopyWithImpl(
      _$ColorListImpl _value, $Res Function(_$ColorListImpl) _then)
      : super(_value, _then);

  /// Create a copy of ColorList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? colorList = null,
  }) {
    return _then(_$ColorListImpl(
      colorList: null == colorList
          ? _value._colorList
          : colorList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ColorListImpl implements _ColorList {
  _$ColorListImpl({required final List<String> colorList})
      : _colorList = colorList;

  factory _$ColorListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ColorListImplFromJson(json);

  final List<String> _colorList;
  @override
  List<String> get colorList {
    if (_colorList is EqualUnmodifiableListView) return _colorList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colorList);
  }

  @override
  String toString() {
    return 'ColorList(colorList: $colorList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorListImpl &&
            const DeepCollectionEquality()
                .equals(other._colorList, _colorList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_colorList));

  /// Create a copy of ColorList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorListImplCopyWith<_$ColorListImpl> get copyWith =>
      __$$ColorListImplCopyWithImpl<_$ColorListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ColorListImplToJson(
      this,
    );
  }
}

abstract class _ColorList implements ColorList {
  factory _ColorList({required final List<String> colorList}) = _$ColorListImpl;

  factory _ColorList.fromJson(Map<String, dynamic> json) =
      _$ColorListImpl.fromJson;

  @override
  List<String> get colorList;

  /// Create a copy of ColorList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorListImplCopyWith<_$ColorListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OtherMatters _$OtherMattersFromJson(Map<String, dynamic> json) {
  return _OtherMatters.fromJson(json);
}

/// @nodoc
mixin _$OtherMatters {
  int get minPrice => throw _privateConstructorUsedError;
  int get maxPrice => throw _privateConstructorUsedError;
  String get dateToUse => throw _privateConstructorUsedError;
  String get desiredDate => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  bool get isShared => throw _privateConstructorUsedError;

  /// Serializes this OtherMatters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtherMatters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtherMattersCopyWith<OtherMatters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherMattersCopyWith<$Res> {
  factory $OtherMattersCopyWith(
          OtherMatters value, $Res Function(OtherMatters) then) =
      _$OtherMattersCopyWithImpl<$Res, OtherMatters>;
  @useResult
  $Res call(
      {int minPrice,
      int maxPrice,
      String dateToUse,
      String desiredDate,
      String text,
      bool isShared});
}

/// @nodoc
class _$OtherMattersCopyWithImpl<$Res, $Val extends OtherMatters>
    implements $OtherMattersCopyWith<$Res> {
  _$OtherMattersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtherMatters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? dateToUse = null,
    Object? desiredDate = null,
    Object? text = null,
    Object? isShared = null,
  }) {
    return _then(_value.copyWith(
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
      dateToUse: null == dateToUse
          ? _value.dateToUse
          : dateToUse // ignore: cast_nullable_to_non_nullable
              as String,
      desiredDate: null == desiredDate
          ? _value.desiredDate
          : desiredDate // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isShared: null == isShared
          ? _value.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtherMattersImplCopyWith<$Res>
    implements $OtherMattersCopyWith<$Res> {
  factory _$$OtherMattersImplCopyWith(
          _$OtherMattersImpl value, $Res Function(_$OtherMattersImpl) then) =
      __$$OtherMattersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int minPrice,
      int maxPrice,
      String dateToUse,
      String desiredDate,
      String text,
      bool isShared});
}

/// @nodoc
class __$$OtherMattersImplCopyWithImpl<$Res>
    extends _$OtherMattersCopyWithImpl<$Res, _$OtherMattersImpl>
    implements _$$OtherMattersImplCopyWith<$Res> {
  __$$OtherMattersImplCopyWithImpl(
      _$OtherMattersImpl _value, $Res Function(_$OtherMattersImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtherMatters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? dateToUse = null,
    Object? desiredDate = null,
    Object? text = null,
    Object? isShared = null,
  }) {
    return _then(_$OtherMattersImpl(
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
      dateToUse: null == dateToUse
          ? _value.dateToUse
          : dateToUse // ignore: cast_nullable_to_non_nullable
              as String,
      desiredDate: null == desiredDate
          ? _value.desiredDate
          : desiredDate // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isShared: null == isShared
          ? _value.isShared
          : isShared // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtherMattersImpl implements _OtherMatters {
  _$OtherMattersImpl(
      {this.minPrice = 0,
      this.maxPrice = 0,
      this.dateToUse = '',
      this.desiredDate = '',
      this.text = '',
      this.isShared = false});

  factory _$OtherMattersImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtherMattersImplFromJson(json);

  @override
  @JsonKey()
  final int minPrice;
  @override
  @JsonKey()
  final int maxPrice;
  @override
  @JsonKey()
  final String dateToUse;
  @override
  @JsonKey()
  final String desiredDate;
  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey()
  final bool isShared;

  @override
  String toString() {
    return 'OtherMatters(minPrice: $minPrice, maxPrice: $maxPrice, dateToUse: $dateToUse, desiredDate: $desiredDate, text: $text, isShared: $isShared)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherMattersImpl &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.dateToUse, dateToUse) ||
                other.dateToUse == dateToUse) &&
            (identical(other.desiredDate, desiredDate) ||
                other.desiredDate == desiredDate) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isShared, isShared) ||
                other.isShared == isShared));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, minPrice, maxPrice, dateToUse, desiredDate, text, isShared);

  /// Create a copy of OtherMatters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherMattersImplCopyWith<_$OtherMattersImpl> get copyWith =>
      __$$OtherMattersImplCopyWithImpl<_$OtherMattersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtherMattersImplToJson(
      this,
    );
  }
}

abstract class _OtherMatters implements OtherMatters {
  factory _OtherMatters(
      {final int minPrice,
      final int maxPrice,
      final String dateToUse,
      final String desiredDate,
      final String text,
      final bool isShared}) = _$OtherMattersImpl;

  factory _OtherMatters.fromJson(Map<String, dynamic> json) =
      _$OtherMattersImpl.fromJson;

  @override
  int get minPrice;
  @override
  int get maxPrice;
  @override
  String get dateToUse;
  @override
  String get desiredDate;
  @override
  String get text;
  @override
  bool get isShared;

  /// Create a copy of OtherMatters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtherMattersImplCopyWith<_$OtherMattersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
