// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_add_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductAddRequestModel _$ProductAddRequestModelFromJson(
    Map<String, dynamic> json) {
  return _ProductAddRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ProductAddRequestModel {
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductAddRequestModelCopyWith<ProductAddRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductAddRequestModelCopyWith<$Res> {
  factory $ProductAddRequestModelCopyWith(ProductAddRequestModel value,
          $Res Function(ProductAddRequestModel) then) =
      _$ProductAddRequestModelCopyWithImpl<$Res, ProductAddRequestModel>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$ProductAddRequestModelCopyWithImpl<$Res,
        $Val extends ProductAddRequestModel>
    implements $ProductAddRequestModelCopyWith<$Res> {
  _$ProductAddRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductAddRequestModelImplCopyWith<$Res>
    implements $ProductAddRequestModelCopyWith<$Res> {
  factory _$$ProductAddRequestModelImplCopyWith(
          _$ProductAddRequestModelImpl value,
          $Res Function(_$ProductAddRequestModelImpl) then) =
      __$$ProductAddRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$ProductAddRequestModelImplCopyWithImpl<$Res>
    extends _$ProductAddRequestModelCopyWithImpl<$Res,
        _$ProductAddRequestModelImpl>
    implements _$$ProductAddRequestModelImplCopyWith<$Res> {
  __$$ProductAddRequestModelImplCopyWithImpl(
      _$ProductAddRequestModelImpl _value,
      $Res Function(_$ProductAddRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$ProductAddRequestModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductAddRequestModelImpl implements _ProductAddRequestModel {
  const _$ProductAddRequestModelImpl({required this.title});

  factory _$ProductAddRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductAddRequestModelImplFromJson(json);

  @override
  final String title;

  @override
  String toString() {
    return 'ProductAddRequestModel(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductAddRequestModelImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductAddRequestModelImplCopyWith<_$ProductAddRequestModelImpl>
      get copyWith => __$$ProductAddRequestModelImplCopyWithImpl<
          _$ProductAddRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductAddRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ProductAddRequestModel implements ProductAddRequestModel {
  const factory _ProductAddRequestModel({required final String title}) =
      _$ProductAddRequestModelImpl;

  factory _ProductAddRequestModel.fromJson(Map<String, dynamic> json) =
      _$ProductAddRequestModelImpl.fromJson;

  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$ProductAddRequestModelImplCopyWith<_$ProductAddRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
