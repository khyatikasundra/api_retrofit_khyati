// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_add_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductAddResponseModel _$ProductAddResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ProductAddResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ProductAddResponseModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductAddResponseModelCopyWith<ProductAddResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductAddResponseModelCopyWith<$Res> {
  factory $ProductAddResponseModelCopyWith(ProductAddResponseModel value,
          $Res Function(ProductAddResponseModel) then) =
      _$ProductAddResponseModelCopyWithImpl<$Res, ProductAddResponseModel>;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$ProductAddResponseModelCopyWithImpl<$Res,
        $Val extends ProductAddResponseModel>
    implements $ProductAddResponseModelCopyWith<$Res> {
  _$ProductAddResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductAddResponseModelImplCopyWith<$Res>
    implements $ProductAddResponseModelCopyWith<$Res> {
  factory _$$ProductAddResponseModelImplCopyWith(
          _$ProductAddResponseModelImpl value,
          $Res Function(_$ProductAddResponseModelImpl) then) =
      __$$ProductAddResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$$ProductAddResponseModelImplCopyWithImpl<$Res>
    extends _$ProductAddResponseModelCopyWithImpl<$Res,
        _$ProductAddResponseModelImpl>
    implements _$$ProductAddResponseModelImplCopyWith<$Res> {
  __$$ProductAddResponseModelImplCopyWithImpl(
      _$ProductAddResponseModelImpl _value,
      $Res Function(_$ProductAddResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$ProductAddResponseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductAddResponseModelImpl implements _ProductAddResponseModel {
  const _$ProductAddResponseModelImpl({required this.id, required this.title});

  factory _$ProductAddResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductAddResponseModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;

  @override
  String toString() {
    return 'ProductAddResponseModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductAddResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductAddResponseModelImplCopyWith<_$ProductAddResponseModelImpl>
      get copyWith => __$$ProductAddResponseModelImplCopyWithImpl<
          _$ProductAddResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductAddResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ProductAddResponseModel implements ProductAddResponseModel {
  const factory _ProductAddResponseModel(
      {required final int id,
      required final String title}) = _$ProductAddResponseModelImpl;

  factory _ProductAddResponseModel.fromJson(Map<String, dynamic> json) =
      _$ProductAddResponseModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$ProductAddResponseModelImplCopyWith<_$ProductAddResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
