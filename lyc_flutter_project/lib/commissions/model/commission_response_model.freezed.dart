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
  String get status => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  CommissionInfo get commissionInfo => throw _privateConstructorUsedError;
  CommissionStyle get commissionStyle => throw _privateConstructorUsedError;
  CommissionOther get commissionOther => throw _privateConstructorUsedError;

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
      String status,
      String createdDate,
      CommissionInfo commissionInfo,
      CommissionStyle commissionStyle,
      CommissionOther commissionOther});

  $CommissionInfoCopyWith<$Res> get commissionInfo;
  $CommissionStyleCopyWith<$Res> get commissionStyle;
  $CommissionOtherCopyWith<$Res> get commissionOther;
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
    Object? status = null,
    Object? createdDate = null,
    Object? commissionInfo = null,
    Object? commissionStyle = null,
    Object? commissionOther = null,
  }) {
    return _then(_value.copyWith(
      commissionId: null == commissionId
          ? _value.commissionId
          : commissionId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      commissionInfo: null == commissionInfo
          ? _value.commissionInfo
          : commissionInfo // ignore: cast_nullable_to_non_nullable
              as CommissionInfo,
      commissionStyle: null == commissionStyle
          ? _value.commissionStyle
          : commissionStyle // ignore: cast_nullable_to_non_nullable
              as CommissionStyle,
      commissionOther: null == commissionOther
          ? _value.commissionOther
          : commissionOther // ignore: cast_nullable_to_non_nullable
              as CommissionOther,
    ) as $Val);
  }

  /// Create a copy of CommissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommissionInfoCopyWith<$Res> get commissionInfo {
    return $CommissionInfoCopyWith<$Res>(_value.commissionInfo, (value) {
      return _then(_value.copyWith(commissionInfo: value) as $Val);
    });
  }

  /// Create a copy of CommissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommissionStyleCopyWith<$Res> get commissionStyle {
    return $CommissionStyleCopyWith<$Res>(_value.commissionStyle, (value) {
      return _then(_value.copyWith(commissionStyle: value) as $Val);
    });
  }

  /// Create a copy of CommissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommissionOtherCopyWith<$Res> get commissionOther {
    return $CommissionOtherCopyWith<$Res>(_value.commissionOther, (value) {
      return _then(_value.copyWith(commissionOther: value) as $Val);
    });
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
      String status,
      String createdDate,
      CommissionInfo commissionInfo,
      CommissionStyle commissionStyle,
      CommissionOther commissionOther});

  @override
  $CommissionInfoCopyWith<$Res> get commissionInfo;
  @override
  $CommissionStyleCopyWith<$Res> get commissionStyle;
  @override
  $CommissionOtherCopyWith<$Res> get commissionOther;
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
    Object? status = null,
    Object? createdDate = null,
    Object? commissionInfo = null,
    Object? commissionStyle = null,
    Object? commissionOther = null,
  }) {
    return _then(_$CommissionResponseModelImpl(
      commissionId: null == commissionId
          ? _value.commissionId
          : commissionId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      commissionInfo: null == commissionInfo
          ? _value.commissionInfo
          : commissionInfo // ignore: cast_nullable_to_non_nullable
              as CommissionInfo,
      commissionStyle: null == commissionStyle
          ? _value.commissionStyle
          : commissionStyle // ignore: cast_nullable_to_non_nullable
              as CommissionStyle,
      commissionOther: null == commissionOther
          ? _value.commissionOther
          : commissionOther // ignore: cast_nullable_to_non_nullable
              as CommissionOther,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionResponseModelImpl implements _CommissionResponseModel {
  _$CommissionResponseModelImpl(
      {required this.commissionId,
      required this.status,
      required this.createdDate,
      required this.commissionInfo,
      required this.commissionStyle,
      required this.commissionOther});

  factory _$CommissionResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionResponseModelImplFromJson(json);

  @override
  final int commissionId;
  @override
  final String status;
  @override
  final String createdDate;
  @override
  final CommissionInfo commissionInfo;
  @override
  final CommissionStyle commissionStyle;
  @override
  final CommissionOther commissionOther;

  @override
  String toString() {
    return 'CommissionResponseModel(commissionId: $commissionId, status: $status, createdDate: $createdDate, commissionInfo: $commissionInfo, commissionStyle: $commissionStyle, commissionOther: $commissionOther)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionResponseModelImpl &&
            (identical(other.commissionId, commissionId) ||
                other.commissionId == commissionId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.commissionInfo, commissionInfo) ||
                other.commissionInfo == commissionInfo) &&
            (identical(other.commissionStyle, commissionStyle) ||
                other.commissionStyle == commissionStyle) &&
            (identical(other.commissionOther, commissionOther) ||
                other.commissionOther == commissionOther));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, commissionId, status,
      createdDate, commissionInfo, commissionStyle, commissionOther);

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
          required final String status,
          required final String createdDate,
          required final CommissionInfo commissionInfo,
          required final CommissionStyle commissionStyle,
          required final CommissionOther commissionOther}) =
      _$CommissionResponseModelImpl;

  factory _CommissionResponseModel.fromJson(Map<String, dynamic> json) =
      _$CommissionResponseModelImpl.fromJson;

  @override
  int get commissionId;
  @override
  String get status;
  @override
  String get createdDate;
  @override
  CommissionInfo get commissionInfo;
  @override
  CommissionStyle get commissionStyle;
  @override
  CommissionOther get commissionOther;

  /// Create a copy of CommissionResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionResponseModelImplCopyWith<_$CommissionResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommissionInfo _$CommissionInfoFromJson(Map<String, dynamic> json) {
  return _CommissionInfo.fromJson(json);
}

/// @nodoc
mixin _$CommissionInfo {
  int get height => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;
  String get topSize => throw _privateConstructorUsedError;
  String get bottomSize => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  List<CommissionInfoStyle> get commissionInfoStyleList =>
      throw _privateConstructorUsedError;
  List<CommissionInfoBodyType> get commissionInfoBodyTypeList =>
      throw _privateConstructorUsedError;
  List<CommissionInfoFit> get commissionInfoFitList =>
      throw _privateConstructorUsedError;
  List<CommissionInfoMaterial> get commissionInfoMaterialList =>
      throw _privateConstructorUsedError;

  /// Serializes this CommissionInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionInfoCopyWith<CommissionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionInfoCopyWith<$Res> {
  factory $CommissionInfoCopyWith(
          CommissionInfo value, $Res Function(CommissionInfo) then) =
      _$CommissionInfoCopyWithImpl<$Res, CommissionInfo>;
  @useResult
  $Res call(
      {int height,
      int weight,
      String topSize,
      String bottomSize,
      String text,
      List<CommissionInfoStyle> commissionInfoStyleList,
      List<CommissionInfoBodyType> commissionInfoBodyTypeList,
      List<CommissionInfoFit> commissionInfoFitList,
      List<CommissionInfoMaterial> commissionInfoMaterialList});
}

/// @nodoc
class _$CommissionInfoCopyWithImpl<$Res, $Val extends CommissionInfo>
    implements $CommissionInfoCopyWith<$Res> {
  _$CommissionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? weight = null,
    Object? topSize = null,
    Object? bottomSize = null,
    Object? text = null,
    Object? commissionInfoStyleList = null,
    Object? commissionInfoBodyTypeList = null,
    Object? commissionInfoFitList = null,
    Object? commissionInfoMaterialList = null,
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
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      commissionInfoStyleList: null == commissionInfoStyleList
          ? _value.commissionInfoStyleList
          : commissionInfoStyleList // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoStyle>,
      commissionInfoBodyTypeList: null == commissionInfoBodyTypeList
          ? _value.commissionInfoBodyTypeList
          : commissionInfoBodyTypeList // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoBodyType>,
      commissionInfoFitList: null == commissionInfoFitList
          ? _value.commissionInfoFitList
          : commissionInfoFitList // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoFit>,
      commissionInfoMaterialList: null == commissionInfoMaterialList
          ? _value.commissionInfoMaterialList
          : commissionInfoMaterialList // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoMaterial>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionInfoImplCopyWith<$Res>
    implements $CommissionInfoCopyWith<$Res> {
  factory _$$CommissionInfoImplCopyWith(_$CommissionInfoImpl value,
          $Res Function(_$CommissionInfoImpl) then) =
      __$$CommissionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int height,
      int weight,
      String topSize,
      String bottomSize,
      String text,
      List<CommissionInfoStyle> commissionInfoStyleList,
      List<CommissionInfoBodyType> commissionInfoBodyTypeList,
      List<CommissionInfoFit> commissionInfoFitList,
      List<CommissionInfoMaterial> commissionInfoMaterialList});
}

/// @nodoc
class __$$CommissionInfoImplCopyWithImpl<$Res>
    extends _$CommissionInfoCopyWithImpl<$Res, _$CommissionInfoImpl>
    implements _$$CommissionInfoImplCopyWith<$Res> {
  __$$CommissionInfoImplCopyWithImpl(
      _$CommissionInfoImpl _value, $Res Function(_$CommissionInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? weight = null,
    Object? topSize = null,
    Object? bottomSize = null,
    Object? text = null,
    Object? commissionInfoStyleList = null,
    Object? commissionInfoBodyTypeList = null,
    Object? commissionInfoFitList = null,
    Object? commissionInfoMaterialList = null,
  }) {
    return _then(_$CommissionInfoImpl(
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
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      commissionInfoStyleList: null == commissionInfoStyleList
          ? _value._commissionInfoStyleList
          : commissionInfoStyleList // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoStyle>,
      commissionInfoBodyTypeList: null == commissionInfoBodyTypeList
          ? _value._commissionInfoBodyTypeList
          : commissionInfoBodyTypeList // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoBodyType>,
      commissionInfoFitList: null == commissionInfoFitList
          ? _value._commissionInfoFitList
          : commissionInfoFitList // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoFit>,
      commissionInfoMaterialList: null == commissionInfoMaterialList
          ? _value._commissionInfoMaterialList
          : commissionInfoMaterialList // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoMaterial>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionInfoImpl implements _CommissionInfo {
  _$CommissionInfoImpl(
      {required this.height,
      required this.weight,
      required this.topSize,
      required this.bottomSize,
      required this.text,
      required final List<CommissionInfoStyle> commissionInfoStyleList,
      required final List<CommissionInfoBodyType> commissionInfoBodyTypeList,
      required final List<CommissionInfoFit> commissionInfoFitList,
      required final List<CommissionInfoMaterial> commissionInfoMaterialList})
      : _commissionInfoStyleList = commissionInfoStyleList,
        _commissionInfoBodyTypeList = commissionInfoBodyTypeList,
        _commissionInfoFitList = commissionInfoFitList,
        _commissionInfoMaterialList = commissionInfoMaterialList;

  factory _$CommissionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionInfoImplFromJson(json);

  @override
  final int height;
  @override
  final int weight;
  @override
  final String topSize;
  @override
  final String bottomSize;
  @override
  final String text;
  final List<CommissionInfoStyle> _commissionInfoStyleList;
  @override
  List<CommissionInfoStyle> get commissionInfoStyleList {
    if (_commissionInfoStyleList is EqualUnmodifiableListView)
      return _commissionInfoStyleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commissionInfoStyleList);
  }

  final List<CommissionInfoBodyType> _commissionInfoBodyTypeList;
  @override
  List<CommissionInfoBodyType> get commissionInfoBodyTypeList {
    if (_commissionInfoBodyTypeList is EqualUnmodifiableListView)
      return _commissionInfoBodyTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commissionInfoBodyTypeList);
  }

  final List<CommissionInfoFit> _commissionInfoFitList;
  @override
  List<CommissionInfoFit> get commissionInfoFitList {
    if (_commissionInfoFitList is EqualUnmodifiableListView)
      return _commissionInfoFitList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commissionInfoFitList);
  }

  final List<CommissionInfoMaterial> _commissionInfoMaterialList;
  @override
  List<CommissionInfoMaterial> get commissionInfoMaterialList {
    if (_commissionInfoMaterialList is EqualUnmodifiableListView)
      return _commissionInfoMaterialList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commissionInfoMaterialList);
  }

  @override
  String toString() {
    return 'CommissionInfo(height: $height, weight: $weight, topSize: $topSize, bottomSize: $bottomSize, text: $text, commissionInfoStyleList: $commissionInfoStyleList, commissionInfoBodyTypeList: $commissionInfoBodyTypeList, commissionInfoFitList: $commissionInfoFitList, commissionInfoMaterialList: $commissionInfoMaterialList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionInfoImpl &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.topSize, topSize) || other.topSize == topSize) &&
            (identical(other.bottomSize, bottomSize) ||
                other.bottomSize == bottomSize) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(
                other._commissionInfoStyleList, _commissionInfoStyleList) &&
            const DeepCollectionEquality().equals(
                other._commissionInfoBodyTypeList,
                _commissionInfoBodyTypeList) &&
            const DeepCollectionEquality()
                .equals(other._commissionInfoFitList, _commissionInfoFitList) &&
            const DeepCollectionEquality().equals(
                other._commissionInfoMaterialList,
                _commissionInfoMaterialList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      height,
      weight,
      topSize,
      bottomSize,
      text,
      const DeepCollectionEquality().hash(_commissionInfoStyleList),
      const DeepCollectionEquality().hash(_commissionInfoBodyTypeList),
      const DeepCollectionEquality().hash(_commissionInfoFitList),
      const DeepCollectionEquality().hash(_commissionInfoMaterialList));

  /// Create a copy of CommissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionInfoImplCopyWith<_$CommissionInfoImpl> get copyWith =>
      __$$CommissionInfoImplCopyWithImpl<_$CommissionInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionInfoImplToJson(
      this,
    );
  }
}

abstract class _CommissionInfo implements CommissionInfo {
  factory _CommissionInfo(
      {required final int height,
      required final int weight,
      required final String topSize,
      required final String bottomSize,
      required final String text,
      required final List<CommissionInfoStyle> commissionInfoStyleList,
      required final List<CommissionInfoBodyType> commissionInfoBodyTypeList,
      required final List<CommissionInfoFit> commissionInfoFitList,
      required final List<CommissionInfoMaterial>
          commissionInfoMaterialList}) = _$CommissionInfoImpl;

  factory _CommissionInfo.fromJson(Map<String, dynamic> json) =
      _$CommissionInfoImpl.fromJson;

  @override
  int get height;
  @override
  int get weight;
  @override
  String get topSize;
  @override
  String get bottomSize;
  @override
  String get text;
  @override
  List<CommissionInfoStyle> get commissionInfoStyleList;
  @override
  List<CommissionInfoBodyType> get commissionInfoBodyTypeList;
  @override
  List<CommissionInfoFit> get commissionInfoFitList;
  @override
  List<CommissionInfoMaterial> get commissionInfoMaterialList;

  /// Create a copy of CommissionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionInfoImplCopyWith<_$CommissionInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommissionInfoStyle _$CommissionInfoStyleFromJson(Map<String, dynamic> json) {
  return _CommissionInfoStyle.fromJson(json);
}

/// @nodoc
mixin _$CommissionInfoStyle {
  String get occasion => throw _privateConstructorUsedError;
  StyleList get styleList => throw _privateConstructorUsedError;
  FitList get fitList => throw _privateConstructorUsedError;
  MaterialList get materialList => throw _privateConstructorUsedError;
  ColorList get colorList => throw _privateConstructorUsedError;

  /// Serializes this CommissionInfoStyle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionInfoStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionInfoStyleCopyWith<CommissionInfoStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionInfoStyleCopyWith<$Res> {
  factory $CommissionInfoStyleCopyWith(
          CommissionInfoStyle value, $Res Function(CommissionInfoStyle) then) =
      _$CommissionInfoStyleCopyWithImpl<$Res, CommissionInfoStyle>;
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
class _$CommissionInfoStyleCopyWithImpl<$Res, $Val extends CommissionInfoStyle>
    implements $CommissionInfoStyleCopyWith<$Res> {
  _$CommissionInfoStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionInfoStyle
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

  /// Create a copy of CommissionInfoStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StyleListCopyWith<$Res> get styleList {
    return $StyleListCopyWith<$Res>(_value.styleList, (value) {
      return _then(_value.copyWith(styleList: value) as $Val);
    });
  }

  /// Create a copy of CommissionInfoStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FitListCopyWith<$Res> get fitList {
    return $FitListCopyWith<$Res>(_value.fitList, (value) {
      return _then(_value.copyWith(fitList: value) as $Val);
    });
  }

  /// Create a copy of CommissionInfoStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialListCopyWith<$Res> get materialList {
    return $MaterialListCopyWith<$Res>(_value.materialList, (value) {
      return _then(_value.copyWith(materialList: value) as $Val);
    });
  }

  /// Create a copy of CommissionInfoStyle
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
abstract class _$$CommissionInfoStyleImplCopyWith<$Res>
    implements $CommissionInfoStyleCopyWith<$Res> {
  factory _$$CommissionInfoStyleImplCopyWith(_$CommissionInfoStyleImpl value,
          $Res Function(_$CommissionInfoStyleImpl) then) =
      __$$CommissionInfoStyleImplCopyWithImpl<$Res>;
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
class __$$CommissionInfoStyleImplCopyWithImpl<$Res>
    extends _$CommissionInfoStyleCopyWithImpl<$Res, _$CommissionInfoStyleImpl>
    implements _$$CommissionInfoStyleImplCopyWith<$Res> {
  __$$CommissionInfoStyleImplCopyWithImpl(_$CommissionInfoStyleImpl _value,
      $Res Function(_$CommissionInfoStyleImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionInfoStyle
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
    return _then(_$CommissionInfoStyleImpl(
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
class _$CommissionInfoStyleImpl implements _CommissionInfoStyle {
  _$CommissionInfoStyleImpl(
      {required this.occasion,
      required this.styleList,
      required this.fitList,
      required this.materialList,
      required this.colorList});

  factory _$CommissionInfoStyleImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionInfoStyleImplFromJson(json);

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
    return 'CommissionInfoStyle(occasion: $occasion, styleList: $styleList, fitList: $fitList, materialList: $materialList, colorList: $colorList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionInfoStyleImpl &&
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

  /// Create a copy of CommissionInfoStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionInfoStyleImplCopyWith<_$CommissionInfoStyleImpl> get copyWith =>
      __$$CommissionInfoStyleImplCopyWithImpl<_$CommissionInfoStyleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionInfoStyleImplToJson(
      this,
    );
  }
}

abstract class _CommissionInfoStyle implements CommissionInfoStyle {
  factory _CommissionInfoStyle(
      {required final String occasion,
      required final StyleList styleList,
      required final FitList fitList,
      required final MaterialList materialList,
      required final ColorList colorList}) = _$CommissionInfoStyleImpl;

  factory _CommissionInfoStyle.fromJson(Map<String, dynamic> json) =
      _$CommissionInfoStyleImpl.fromJson;

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

  /// Create a copy of CommissionInfoStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionInfoStyleImplCopyWith<_$CommissionInfoStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommissionInfoBodyType _$CommissionInfoBodyTypeFromJson(
    Map<String, dynamic> json) {
  return _CommissionInfoBodyType.fromJson(json);
}

/// @nodoc
mixin _$CommissionInfoBodyType {
  List<String> get bodyTypes => throw _privateConstructorUsedError;

  /// Serializes this CommissionInfoBodyType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionInfoBodyType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionInfoBodyTypeCopyWith<CommissionInfoBodyType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionInfoBodyTypeCopyWith<$Res> {
  factory $CommissionInfoBodyTypeCopyWith(CommissionInfoBodyType value,
          $Res Function(CommissionInfoBodyType) then) =
      _$CommissionInfoBodyTypeCopyWithImpl<$Res, CommissionInfoBodyType>;
  @useResult
  $Res call({List<String> bodyTypes});
}

/// @nodoc
class _$CommissionInfoBodyTypeCopyWithImpl<$Res,
        $Val extends CommissionInfoBodyType>
    implements $CommissionInfoBodyTypeCopyWith<$Res> {
  _$CommissionInfoBodyTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionInfoBodyType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodyTypes = null,
  }) {
    return _then(_value.copyWith(
      bodyTypes: null == bodyTypes
          ? _value.bodyTypes
          : bodyTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionInfoBodyTypeImplCopyWith<$Res>
    implements $CommissionInfoBodyTypeCopyWith<$Res> {
  factory _$$CommissionInfoBodyTypeImplCopyWith(
          _$CommissionInfoBodyTypeImpl value,
          $Res Function(_$CommissionInfoBodyTypeImpl) then) =
      __$$CommissionInfoBodyTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> bodyTypes});
}

/// @nodoc
class __$$CommissionInfoBodyTypeImplCopyWithImpl<$Res>
    extends _$CommissionInfoBodyTypeCopyWithImpl<$Res,
        _$CommissionInfoBodyTypeImpl>
    implements _$$CommissionInfoBodyTypeImplCopyWith<$Res> {
  __$$CommissionInfoBodyTypeImplCopyWithImpl(
      _$CommissionInfoBodyTypeImpl _value,
      $Res Function(_$CommissionInfoBodyTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionInfoBodyType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodyTypes = null,
  }) {
    return _then(_$CommissionInfoBodyTypeImpl(
      bodyTypes: null == bodyTypes
          ? _value._bodyTypes
          : bodyTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionInfoBodyTypeImpl implements _CommissionInfoBodyType {
  _$CommissionInfoBodyTypeImpl({required final List<String> bodyTypes})
      : _bodyTypes = bodyTypes;

  factory _$CommissionInfoBodyTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionInfoBodyTypeImplFromJson(json);

  final List<String> _bodyTypes;
  @override
  List<String> get bodyTypes {
    if (_bodyTypes is EqualUnmodifiableListView) return _bodyTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bodyTypes);
  }

  @override
  String toString() {
    return 'CommissionInfoBodyType(bodyTypes: $bodyTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionInfoBodyTypeImpl &&
            const DeepCollectionEquality()
                .equals(other._bodyTypes, _bodyTypes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_bodyTypes));

  /// Create a copy of CommissionInfoBodyType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionInfoBodyTypeImplCopyWith<_$CommissionInfoBodyTypeImpl>
      get copyWith => __$$CommissionInfoBodyTypeImplCopyWithImpl<
          _$CommissionInfoBodyTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionInfoBodyTypeImplToJson(
      this,
    );
  }
}

abstract class _CommissionInfoBodyType implements CommissionInfoBodyType {
  factory _CommissionInfoBodyType({required final List<String> bodyTypes}) =
      _$CommissionInfoBodyTypeImpl;

  factory _CommissionInfoBodyType.fromJson(Map<String, dynamic> json) =
      _$CommissionInfoBodyTypeImpl.fromJson;

  @override
  List<String> get bodyTypes;

  /// Create a copy of CommissionInfoBodyType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionInfoBodyTypeImplCopyWith<_$CommissionInfoBodyTypeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommissionInfoFit _$CommissionInfoFitFromJson(Map<String, dynamic> json) {
  return _CommissionInfoFit.fromJson(json);
}

/// @nodoc
mixin _$CommissionInfoFit {
  List<String> get fits => throw _privateConstructorUsedError;

  /// Serializes this CommissionInfoFit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionInfoFit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionInfoFitCopyWith<CommissionInfoFit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionInfoFitCopyWith<$Res> {
  factory $CommissionInfoFitCopyWith(
          CommissionInfoFit value, $Res Function(CommissionInfoFit) then) =
      _$CommissionInfoFitCopyWithImpl<$Res, CommissionInfoFit>;
  @useResult
  $Res call({List<String> fits});
}

/// @nodoc
class _$CommissionInfoFitCopyWithImpl<$Res, $Val extends CommissionInfoFit>
    implements $CommissionInfoFitCopyWith<$Res> {
  _$CommissionInfoFitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionInfoFit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fits = null,
  }) {
    return _then(_value.copyWith(
      fits: null == fits
          ? _value.fits
          : fits // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionInfoFitImplCopyWith<$Res>
    implements $CommissionInfoFitCopyWith<$Res> {
  factory _$$CommissionInfoFitImplCopyWith(_$CommissionInfoFitImpl value,
          $Res Function(_$CommissionInfoFitImpl) then) =
      __$$CommissionInfoFitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> fits});
}

/// @nodoc
class __$$CommissionInfoFitImplCopyWithImpl<$Res>
    extends _$CommissionInfoFitCopyWithImpl<$Res, _$CommissionInfoFitImpl>
    implements _$$CommissionInfoFitImplCopyWith<$Res> {
  __$$CommissionInfoFitImplCopyWithImpl(_$CommissionInfoFitImpl _value,
      $Res Function(_$CommissionInfoFitImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionInfoFit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fits = null,
  }) {
    return _then(_$CommissionInfoFitImpl(
      fits: null == fits
          ? _value._fits
          : fits // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionInfoFitImpl implements _CommissionInfoFit {
  _$CommissionInfoFitImpl({required final List<String> fits}) : _fits = fits;

  factory _$CommissionInfoFitImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionInfoFitImplFromJson(json);

  final List<String> _fits;
  @override
  List<String> get fits {
    if (_fits is EqualUnmodifiableListView) return _fits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fits);
  }

  @override
  String toString() {
    return 'CommissionInfoFit(fits: $fits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionInfoFitImpl &&
            const DeepCollectionEquality().equals(other._fits, _fits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_fits));

  /// Create a copy of CommissionInfoFit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionInfoFitImplCopyWith<_$CommissionInfoFitImpl> get copyWith =>
      __$$CommissionInfoFitImplCopyWithImpl<_$CommissionInfoFitImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionInfoFitImplToJson(
      this,
    );
  }
}

abstract class _CommissionInfoFit implements CommissionInfoFit {
  factory _CommissionInfoFit({required final List<String> fits}) =
      _$CommissionInfoFitImpl;

  factory _CommissionInfoFit.fromJson(Map<String, dynamic> json) =
      _$CommissionInfoFitImpl.fromJson;

  @override
  List<String> get fits;

  /// Create a copy of CommissionInfoFit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionInfoFitImplCopyWith<_$CommissionInfoFitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommissionInfoMaterial _$CommissionInfoMaterialFromJson(
    Map<String, dynamic> json) {
  return _CommissionInfoMaterial.fromJson(json);
}

/// @nodoc
mixin _$CommissionInfoMaterial {
  List<String> get materials => throw _privateConstructorUsedError;

  /// Serializes this CommissionInfoMaterial to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionInfoMaterial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionInfoMaterialCopyWith<CommissionInfoMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionInfoMaterialCopyWith<$Res> {
  factory $CommissionInfoMaterialCopyWith(CommissionInfoMaterial value,
          $Res Function(CommissionInfoMaterial) then) =
      _$CommissionInfoMaterialCopyWithImpl<$Res, CommissionInfoMaterial>;
  @useResult
  $Res call({List<String> materials});
}

/// @nodoc
class _$CommissionInfoMaterialCopyWithImpl<$Res,
        $Val extends CommissionInfoMaterial>
    implements $CommissionInfoMaterialCopyWith<$Res> {
  _$CommissionInfoMaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionInfoMaterial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
  }) {
    return _then(_value.copyWith(
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionInfoMaterialImplCopyWith<$Res>
    implements $CommissionInfoMaterialCopyWith<$Res> {
  factory _$$CommissionInfoMaterialImplCopyWith(
          _$CommissionInfoMaterialImpl value,
          $Res Function(_$CommissionInfoMaterialImpl) then) =
      __$$CommissionInfoMaterialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> materials});
}

/// @nodoc
class __$$CommissionInfoMaterialImplCopyWithImpl<$Res>
    extends _$CommissionInfoMaterialCopyWithImpl<$Res,
        _$CommissionInfoMaterialImpl>
    implements _$$CommissionInfoMaterialImplCopyWith<$Res> {
  __$$CommissionInfoMaterialImplCopyWithImpl(
      _$CommissionInfoMaterialImpl _value,
      $Res Function(_$CommissionInfoMaterialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionInfoMaterial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
  }) {
    return _then(_$CommissionInfoMaterialImpl(
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionInfoMaterialImpl implements _CommissionInfoMaterial {
  _$CommissionInfoMaterialImpl({required final List<String> materials})
      : _materials = materials;

  factory _$CommissionInfoMaterialImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionInfoMaterialImplFromJson(json);

  final List<String> _materials;
  @override
  List<String> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'CommissionInfoMaterial(materials: $materials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionInfoMaterialImpl &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_materials));

  /// Create a copy of CommissionInfoMaterial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionInfoMaterialImplCopyWith<_$CommissionInfoMaterialImpl>
      get copyWith => __$$CommissionInfoMaterialImplCopyWithImpl<
          _$CommissionInfoMaterialImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionInfoMaterialImplToJson(
      this,
    );
  }
}

abstract class _CommissionInfoMaterial implements CommissionInfoMaterial {
  factory _CommissionInfoMaterial({required final List<String> materials}) =
      _$CommissionInfoMaterialImpl;

  factory _CommissionInfoMaterial.fromJson(Map<String, dynamic> json) =
      _$CommissionInfoMaterialImpl.fromJson;

  @override
  List<String> get materials;

  /// Create a copy of CommissionInfoMaterial
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionInfoMaterialImplCopyWith<_$CommissionInfoMaterialImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CommissionStyle _$CommissionStyleFromJson(Map<String, dynamic> json) {
  return _CommissionStyle.fromJson(json);
}

/// @nodoc
mixin _$CommissionStyle {
  List<CommissionInfoStyle> get style => throw _privateConstructorUsedError;
  List<CommissionInfoMaterial> get material =>
      throw _privateConstructorUsedError;
  List<CommissionInfoFit> get fit => throw _privateConstructorUsedError;
  List<CommissionInfoColor> get color => throw _privateConstructorUsedError;

  /// Serializes this CommissionStyle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionStyleCopyWith<CommissionStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionStyleCopyWith<$Res> {
  factory $CommissionStyleCopyWith(
          CommissionStyle value, $Res Function(CommissionStyle) then) =
      _$CommissionStyleCopyWithImpl<$Res, CommissionStyle>;
  @useResult
  $Res call(
      {List<CommissionInfoStyle> style,
      List<CommissionInfoMaterial> material,
      List<CommissionInfoFit> fit,
      List<CommissionInfoColor> color});
}

/// @nodoc
class _$CommissionStyleCopyWithImpl<$Res, $Val extends CommissionStyle>
    implements $CommissionStyleCopyWith<$Res> {
  _$CommissionStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? style = null,
    Object? material = null,
    Object? fit = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoStyle>,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoMaterial>,
      fit: null == fit
          ? _value.fit
          : fit // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoFit>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoColor>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionStyleImplCopyWith<$Res>
    implements $CommissionStyleCopyWith<$Res> {
  factory _$$CommissionStyleImplCopyWith(_$CommissionStyleImpl value,
          $Res Function(_$CommissionStyleImpl) then) =
      __$$CommissionStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CommissionInfoStyle> style,
      List<CommissionInfoMaterial> material,
      List<CommissionInfoFit> fit,
      List<CommissionInfoColor> color});
}

/// @nodoc
class __$$CommissionStyleImplCopyWithImpl<$Res>
    extends _$CommissionStyleCopyWithImpl<$Res, _$CommissionStyleImpl>
    implements _$$CommissionStyleImplCopyWith<$Res> {
  __$$CommissionStyleImplCopyWithImpl(
      _$CommissionStyleImpl _value, $Res Function(_$CommissionStyleImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionStyle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? style = null,
    Object? material = null,
    Object? fit = null,
    Object? color = null,
  }) {
    return _then(_$CommissionStyleImpl(
      style: null == style
          ? _value._style
          : style // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoStyle>,
      material: null == material
          ? _value._material
          : material // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoMaterial>,
      fit: null == fit
          ? _value._fit
          : fit // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoFit>,
      color: null == color
          ? _value._color
          : color // ignore: cast_nullable_to_non_nullable
              as List<CommissionInfoColor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionStyleImpl implements _CommissionStyle {
  _$CommissionStyleImpl(
      {required final List<CommissionInfoStyle> style,
      required final List<CommissionInfoMaterial> material,
      required final List<CommissionInfoFit> fit,
      required final List<CommissionInfoColor> color})
      : _style = style,
        _material = material,
        _fit = fit,
        _color = color;

  factory _$CommissionStyleImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionStyleImplFromJson(json);

  final List<CommissionInfoStyle> _style;
  @override
  List<CommissionInfoStyle> get style {
    if (_style is EqualUnmodifiableListView) return _style;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_style);
  }

  final List<CommissionInfoMaterial> _material;
  @override
  List<CommissionInfoMaterial> get material {
    if (_material is EqualUnmodifiableListView) return _material;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_material);
  }

  final List<CommissionInfoFit> _fit;
  @override
  List<CommissionInfoFit> get fit {
    if (_fit is EqualUnmodifiableListView) return _fit;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fit);
  }

  final List<CommissionInfoColor> _color;
  @override
  List<CommissionInfoColor> get color {
    if (_color is EqualUnmodifiableListView) return _color;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_color);
  }

  @override
  String toString() {
    return 'CommissionStyle(style: $style, material: $material, fit: $fit, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionStyleImpl &&
            const DeepCollectionEquality().equals(other._style, _style) &&
            const DeepCollectionEquality().equals(other._material, _material) &&
            const DeepCollectionEquality().equals(other._fit, _fit) &&
            const DeepCollectionEquality().equals(other._color, _color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_style),
      const DeepCollectionEquality().hash(_material),
      const DeepCollectionEquality().hash(_fit),
      const DeepCollectionEquality().hash(_color));

  /// Create a copy of CommissionStyle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionStyleImplCopyWith<_$CommissionStyleImpl> get copyWith =>
      __$$CommissionStyleImplCopyWithImpl<_$CommissionStyleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionStyleImplToJson(
      this,
    );
  }
}

abstract class _CommissionStyle implements CommissionStyle {
  factory _CommissionStyle(
      {required final List<CommissionInfoStyle> style,
      required final List<CommissionInfoMaterial> material,
      required final List<CommissionInfoFit> fit,
      required final List<CommissionInfoColor> color}) = _$CommissionStyleImpl;

  factory _CommissionStyle.fromJson(Map<String, dynamic> json) =
      _$CommissionStyleImpl.fromJson;

  @override
  List<CommissionInfoStyle> get style;
  @override
  List<CommissionInfoMaterial> get material;
  @override
  List<CommissionInfoFit> get fit;
  @override
  List<CommissionInfoColor> get color;

  /// Create a copy of CommissionStyle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionStyleImplCopyWith<_$CommissionStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommissionInfoColor _$CommissionInfoColorFromJson(Map<String, dynamic> json) {
  return _CommissionInfoColor.fromJson(json);
}

/// @nodoc
mixin _$CommissionInfoColor {
  String get color => throw _privateConstructorUsedError;
  bool get isPrefer => throw _privateConstructorUsedError;

  /// Serializes this CommissionInfoColor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionInfoColor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionInfoColorCopyWith<CommissionInfoColor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionInfoColorCopyWith<$Res> {
  factory $CommissionInfoColorCopyWith(
          CommissionInfoColor value, $Res Function(CommissionInfoColor) then) =
      _$CommissionInfoColorCopyWithImpl<$Res, CommissionInfoColor>;
  @useResult
  $Res call({String color, bool isPrefer});
}

/// @nodoc
class _$CommissionInfoColorCopyWithImpl<$Res, $Val extends CommissionInfoColor>
    implements $CommissionInfoColorCopyWith<$Res> {
  _$CommissionInfoColorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionInfoColor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? isPrefer = null,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isPrefer: null == isPrefer
          ? _value.isPrefer
          : isPrefer // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionInfoColorImplCopyWith<$Res>
    implements $CommissionInfoColorCopyWith<$Res> {
  factory _$$CommissionInfoColorImplCopyWith(_$CommissionInfoColorImpl value,
          $Res Function(_$CommissionInfoColorImpl) then) =
      __$$CommissionInfoColorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String color, bool isPrefer});
}

/// @nodoc
class __$$CommissionInfoColorImplCopyWithImpl<$Res>
    extends _$CommissionInfoColorCopyWithImpl<$Res, _$CommissionInfoColorImpl>
    implements _$$CommissionInfoColorImplCopyWith<$Res> {
  __$$CommissionInfoColorImplCopyWithImpl(_$CommissionInfoColorImpl _value,
      $Res Function(_$CommissionInfoColorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionInfoColor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? isPrefer = null,
  }) {
    return _then(_$CommissionInfoColorImpl(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isPrefer: null == isPrefer
          ? _value.isPrefer
          : isPrefer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionInfoColorImpl implements _CommissionInfoColor {
  _$CommissionInfoColorImpl({required this.color, required this.isPrefer});

  factory _$CommissionInfoColorImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionInfoColorImplFromJson(json);

  @override
  final String color;
  @override
  final bool isPrefer;

  @override
  String toString() {
    return 'CommissionInfoColor(color: $color, isPrefer: $isPrefer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionInfoColorImpl &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isPrefer, isPrefer) ||
                other.isPrefer == isPrefer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, color, isPrefer);

  /// Create a copy of CommissionInfoColor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionInfoColorImplCopyWith<_$CommissionInfoColorImpl> get copyWith =>
      __$$CommissionInfoColorImplCopyWithImpl<_$CommissionInfoColorImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionInfoColorImplToJson(
      this,
    );
  }
}

abstract class _CommissionInfoColor implements CommissionInfoColor {
  factory _CommissionInfoColor(
      {required final String color,
      required final bool isPrefer}) = _$CommissionInfoColorImpl;

  factory _CommissionInfoColor.fromJson(Map<String, dynamic> json) =
      _$CommissionInfoColorImpl.fromJson;

  @override
  String get color;
  @override
  bool get isPrefer;

  /// Create a copy of CommissionInfoColor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionInfoColorImplCopyWith<_$CommissionInfoColorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommissionOther _$CommissionOtherFromJson(Map<String, dynamic> json) {
  return _CommissionOther.fromJson(json);
}

/// @nodoc
mixin _$CommissionOther {
  String get dateToUse => throw _privateConstructorUsedError;
  String get desiredDate => throw _privateConstructorUsedError;
  int get minPrice => throw _privateConstructorUsedError;
  int get maxPrice => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this CommissionOther to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommissionOther
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommissionOtherCopyWith<CommissionOther> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionOtherCopyWith<$Res> {
  factory $CommissionOtherCopyWith(
          CommissionOther value, $Res Function(CommissionOther) then) =
      _$CommissionOtherCopyWithImpl<$Res, CommissionOther>;
  @useResult
  $Res call(
      {String dateToUse,
      String desiredDate,
      int minPrice,
      int maxPrice,
      String text});
}

/// @nodoc
class _$CommissionOtherCopyWithImpl<$Res, $Val extends CommissionOther>
    implements $CommissionOtherCopyWith<$Res> {
  _$CommissionOtherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommissionOther
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateToUse = null,
    Object? desiredDate = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      dateToUse: null == dateToUse
          ? _value.dateToUse
          : dateToUse // ignore: cast_nullable_to_non_nullable
              as String,
      desiredDate: null == desiredDate
          ? _value.desiredDate
          : desiredDate // ignore: cast_nullable_to_non_nullable
              as String,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionOtherImplCopyWith<$Res>
    implements $CommissionOtherCopyWith<$Res> {
  factory _$$CommissionOtherImplCopyWith(_$CommissionOtherImpl value,
          $Res Function(_$CommissionOtherImpl) then) =
      __$$CommissionOtherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dateToUse,
      String desiredDate,
      int minPrice,
      int maxPrice,
      String text});
}

/// @nodoc
class __$$CommissionOtherImplCopyWithImpl<$Res>
    extends _$CommissionOtherCopyWithImpl<$Res, _$CommissionOtherImpl>
    implements _$$CommissionOtherImplCopyWith<$Res> {
  __$$CommissionOtherImplCopyWithImpl(
      _$CommissionOtherImpl _value, $Res Function(_$CommissionOtherImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommissionOther
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateToUse = null,
    Object? desiredDate = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? text = null,
  }) {
    return _then(_$CommissionOtherImpl(
      dateToUse: null == dateToUse
          ? _value.dateToUse
          : dateToUse // ignore: cast_nullable_to_non_nullable
              as String,
      desiredDate: null == desiredDate
          ? _value.desiredDate
          : desiredDate // ignore: cast_nullable_to_non_nullable
              as String,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as int,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionOtherImpl implements _CommissionOther {
  _$CommissionOtherImpl(
      {required this.dateToUse,
      required this.desiredDate,
      required this.minPrice,
      required this.maxPrice,
      required this.text});

  factory _$CommissionOtherImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionOtherImplFromJson(json);

  @override
  final String dateToUse;
  @override
  final String desiredDate;
  @override
  final int minPrice;
  @override
  final int maxPrice;
  @override
  final String text;

  @override
  String toString() {
    return 'CommissionOther(dateToUse: $dateToUse, desiredDate: $desiredDate, minPrice: $minPrice, maxPrice: $maxPrice, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionOtherImpl &&
            (identical(other.dateToUse, dateToUse) ||
                other.dateToUse == dateToUse) &&
            (identical(other.desiredDate, desiredDate) ||
                other.desiredDate == desiredDate) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, dateToUse, desiredDate, minPrice, maxPrice, text);

  /// Create a copy of CommissionOther
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionOtherImplCopyWith<_$CommissionOtherImpl> get copyWith =>
      __$$CommissionOtherImplCopyWithImpl<_$CommissionOtherImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionOtherImplToJson(
      this,
    );
  }
}

abstract class _CommissionOther implements CommissionOther {
  factory _CommissionOther(
      {required final String dateToUse,
      required final String desiredDate,
      required final int minPrice,
      required final int maxPrice,
      required final String text}) = _$CommissionOtherImpl;

  factory _CommissionOther.fromJson(Map<String, dynamic> json) =
      _$CommissionOtherImpl.fromJson;

  @override
  String get dateToUse;
  @override
  String get desiredDate;
  @override
  int get minPrice;
  @override
  int get maxPrice;
  @override
  String get text;

  /// Create a copy of CommissionOther
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommissionOtherImplCopyWith<_$CommissionOtherImpl> get copyWith =>
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
