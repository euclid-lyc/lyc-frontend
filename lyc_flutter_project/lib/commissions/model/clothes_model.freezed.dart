// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clothes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClothesModel _$ClothesModelFromJson(Map<String, dynamic> json) {
  return _ClothesModel.fromJson(json);
}

/// @nodoc
mixin _$ClothesModel {
  int? get clothesId => throw _privateConstructorUsedError; // Optional field
  String get imageUrl => throw _privateConstructorUsedError;
  String get clothesUrl => throw _privateConstructorUsedError;

  /// Serializes this ClothesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClothesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClothesModelCopyWith<ClothesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClothesModelCopyWith<$Res> {
  factory $ClothesModelCopyWith(
          ClothesModel value, $Res Function(ClothesModel) then) =
      _$ClothesModelCopyWithImpl<$Res, ClothesModel>;
  @useResult
  $Res call({int? clothesId, String imageUrl, String clothesUrl});
}

/// @nodoc
class _$ClothesModelCopyWithImpl<$Res, $Val extends ClothesModel>
    implements $ClothesModelCopyWith<$Res> {
  _$ClothesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClothesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clothesId = freezed,
    Object? imageUrl = null,
    Object? clothesUrl = null,
  }) {
    return _then(_value.copyWith(
      clothesId: freezed == clothesId
          ? _value.clothesId
          : clothesId // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      clothesUrl: null == clothesUrl
          ? _value.clothesUrl
          : clothesUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClothesModelImplCopyWith<$Res>
    implements $ClothesModelCopyWith<$Res> {
  factory _$$ClothesModelImplCopyWith(
          _$ClothesModelImpl value, $Res Function(_$ClothesModelImpl) then) =
      __$$ClothesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? clothesId, String imageUrl, String clothesUrl});
}

/// @nodoc
class __$$ClothesModelImplCopyWithImpl<$Res>
    extends _$ClothesModelCopyWithImpl<$Res, _$ClothesModelImpl>
    implements _$$ClothesModelImplCopyWith<$Res> {
  __$$ClothesModelImplCopyWithImpl(
      _$ClothesModelImpl _value, $Res Function(_$ClothesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClothesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clothesId = freezed,
    Object? imageUrl = null,
    Object? clothesUrl = null,
  }) {
    return _then(_$ClothesModelImpl(
      clothesId: freezed == clothesId
          ? _value.clothesId
          : clothesId // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      clothesUrl: null == clothesUrl
          ? _value.clothesUrl
          : clothesUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClothesModelImpl implements _ClothesModel {
  const _$ClothesModelImpl(
      {this.clothesId, required this.imageUrl, required this.clothesUrl});

  factory _$ClothesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClothesModelImplFromJson(json);

  @override
  final int? clothesId;
// Optional field
  @override
  final String imageUrl;
  @override
  final String clothesUrl;

  @override
  String toString() {
    return 'ClothesModel(clothesId: $clothesId, imageUrl: $imageUrl, clothesUrl: $clothesUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClothesModelImpl &&
            (identical(other.clothesId, clothesId) ||
                other.clothesId == clothesId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.clothesUrl, clothesUrl) ||
                other.clothesUrl == clothesUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clothesId, imageUrl, clothesUrl);

  /// Create a copy of ClothesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClothesModelImplCopyWith<_$ClothesModelImpl> get copyWith =>
      __$$ClothesModelImplCopyWithImpl<_$ClothesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClothesModelImplToJson(
      this,
    );
  }
}

abstract class _ClothesModel implements ClothesModel {
  const factory _ClothesModel(
      {final int? clothesId,
      required final String imageUrl,
      required final String clothesUrl}) = _$ClothesModelImpl;

  factory _ClothesModel.fromJson(Map<String, dynamic> json) =
      _$ClothesModelImpl.fromJson;

  @override
  int? get clothesId; // Optional field
  @override
  String get imageUrl;
  @override
  String get clothesUrl;

  /// Create a copy of ClothesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClothesModelImplCopyWith<_$ClothesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
