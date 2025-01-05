// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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

  @override
  @pragma('vm:prefer-inline')
  $InfoStyleCopyWith<$Res> get infoStyle {
    return $InfoStyleCopyWith<$Res>(_value.infoStyle, (value) {
      return _then(_value.copyWith(infoStyle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InfoFitCopyWith<$Res> get infoFit {
    return $InfoFitCopyWith<$Res>(_value.infoFit, (value) {
      return _then(_value.copyWith(infoFit: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $InfoMaterialCopyWith<$Res> get infoMaterial {
    return $InfoMaterialCopyWith<$Res>(_value.infoMaterial, (value) {
      return _then(_value.copyWith(infoMaterial: value) as $Val);
    });
  }

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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
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
  @override
  @JsonKey(ignore: true)
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      {required final List<String> preferredStyleList,
      required final List<String> nonPreferredStyleList})
      : _preferredStyleList = preferredStyleList,
        _nonPreferredStyleList = nonPreferredStyleList;

  factory _$InfoStyleImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoStyleImplFromJson(json);

  final List<String> _preferredStyleList;
  @override
  List<String> get preferredStyleList {
    if (_preferredStyleList is EqualUnmodifiableListView)
      return _preferredStyleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredStyleList);
  }

  final List<String> _nonPreferredStyleList;
  @override
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_preferredStyleList),
      const DeepCollectionEquality().hash(_nonPreferredStyleList));

  @JsonKey(ignore: true)
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
      {required final List<String> preferredStyleList,
      required final List<String> nonPreferredStyleList}) = _$InfoStyleImpl;

  factory _InfoStyle.fromJson(Map<String, dynamic> json) =
      _$InfoStyleImpl.fromJson;

  @override
  List<String> get preferredStyleList;
  @override
  List<String> get nonPreferredStyleList;
  @override
  @JsonKey(ignore: true)
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      {required final List<String> preferredFitList,
      required final List<String> nonPreferredFitList})
      : _preferredFitList = preferredFitList,
        _nonPreferredFitList = nonPreferredFitList;

  factory _$InfoFitImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoFitImplFromJson(json);

  final List<String> _preferredFitList;
  @override
  List<String> get preferredFitList {
    if (_preferredFitList is EqualUnmodifiableListView)
      return _preferredFitList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredFitList);
  }

  final List<String> _nonPreferredFitList;
  @override
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_preferredFitList),
      const DeepCollectionEquality().hash(_nonPreferredFitList));

  @JsonKey(ignore: true)
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
      {required final List<String> preferredFitList,
      required final List<String> nonPreferredFitList}) = _$InfoFitImpl;

  factory _InfoFit.fromJson(Map<String, dynamic> json) = _$InfoFitImpl.fromJson;

  @override
  List<String> get preferredFitList;
  @override
  List<String> get nonPreferredFitList;
  @override
  @JsonKey(ignore: true)
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      {required final List<String> preferredMaterialList,
      required final List<String> nonPreferredMaterialList})
      : _preferredMaterialList = preferredMaterialList,
        _nonPreferredMaterialList = nonPreferredMaterialList;

  factory _$InfoMaterialImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoMaterialImplFromJson(json);

  final List<String> _preferredMaterialList;
  @override
  List<String> get preferredMaterialList {
    if (_preferredMaterialList is EqualUnmodifiableListView)
      return _preferredMaterialList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredMaterialList);
  }

  final List<String> _nonPreferredMaterialList;
  @override
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_preferredMaterialList),
      const DeepCollectionEquality().hash(_nonPreferredMaterialList));

  @JsonKey(ignore: true)
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
          {required final List<String> preferredMaterialList,
          required final List<String> nonPreferredMaterialList}) =
      _$InfoMaterialImpl;

  factory _InfoMaterial.fromJson(Map<String, dynamic> json) =
      _$InfoMaterialImpl.fromJson;

  @override
  List<String> get preferredMaterialList;
  @override
  List<String> get nonPreferredMaterialList;
  @override
  @JsonKey(ignore: true)
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      {required final List<String> goodBodyTypeList,
      required final List<String> badBodyTypeList})
      : _goodBodyTypeList = goodBodyTypeList,
        _badBodyTypeList = badBodyTypeList;

  factory _$InfoBodyTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoBodyTypeImplFromJson(json);

  final List<String> _goodBodyTypeList;
  @override
  List<String> get goodBodyTypeList {
    if (_goodBodyTypeList is EqualUnmodifiableListView)
      return _goodBodyTypeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goodBodyTypeList);
  }

  final List<String> _badBodyTypeList;
  @override
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_goodBodyTypeList),
      const DeepCollectionEquality().hash(_badBodyTypeList));

  @JsonKey(ignore: true)
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
      {required final List<String> goodBodyTypeList,
      required final List<String> badBodyTypeList}) = _$InfoBodyTypeImpl;

  factory _InfoBodyType.fromJson(Map<String, dynamic> json) =
      _$InfoBodyTypeImpl.fromJson;

  @override
  List<String> get goodBodyTypeList;
  @override
  List<String> get badBodyTypeList;
  @override
  @JsonKey(ignore: true)
  _$$InfoBodyTypeImplCopyWith<_$InfoBodyTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
