// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_matters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  bool get isShareClothesList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      bool isShareClothesList});
}

/// @nodoc
class _$OtherMattersCopyWithImpl<$Res, $Val extends OtherMatters>
    implements $OtherMattersCopyWith<$Res> {
  _$OtherMattersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? dateToUse = null,
    Object? desiredDate = null,
    Object? text = null,
    Object? isShareClothesList = null,
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
      isShareClothesList: null == isShareClothesList
          ? _value.isShareClothesList
          : isShareClothesList // ignore: cast_nullable_to_non_nullable
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
      bool isShareClothesList});
}

/// @nodoc
class __$$OtherMattersImplCopyWithImpl<$Res>
    extends _$OtherMattersCopyWithImpl<$Res, _$OtherMattersImpl>
    implements _$$OtherMattersImplCopyWith<$Res> {
  __$$OtherMattersImplCopyWithImpl(
      _$OtherMattersImpl _value, $Res Function(_$OtherMattersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? dateToUse = null,
    Object? desiredDate = null,
    Object? text = null,
    Object? isShareClothesList = null,
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
      isShareClothesList: null == isShareClothesList
          ? _value.isShareClothesList
          : isShareClothesList // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtherMattersImpl implements _OtherMatters {
  const _$OtherMattersImpl(
      {required this.minPrice,
      required this.maxPrice,
      required this.dateToUse,
      required this.desiredDate,
      required this.text,
      required this.isShareClothesList});

  factory _$OtherMattersImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtherMattersImplFromJson(json);

  @override
  final int minPrice;
  @override
  final int maxPrice;
  @override
  final String dateToUse;
  @override
  final String desiredDate;
  @override
  final String text;
  @override
  final bool isShareClothesList;

  @override
  String toString() {
    return 'OtherMatters(minPrice: $minPrice, maxPrice: $maxPrice, dateToUse: $dateToUse, desiredDate: $desiredDate, text: $text, isShareClothesList: $isShareClothesList)';
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
            (identical(other.isShareClothesList, isShareClothesList) ||
                other.isShareClothesList == isShareClothesList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, minPrice, maxPrice, dateToUse,
      desiredDate, text, isShareClothesList);

  @JsonKey(ignore: true)
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
  const factory _OtherMatters(
      {required final int minPrice,
      required final int maxPrice,
      required final String dateToUse,
      required final String desiredDate,
      required final String text,
      required final bool isShareClothesList}) = _$OtherMattersImpl;

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
  bool get isShareClothesList;
  @override
  @JsonKey(ignore: true)
  _$$OtherMattersImplCopyWith<_$OtherMattersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
