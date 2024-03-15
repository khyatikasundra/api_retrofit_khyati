// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FailureResponse _$FailureResponseFromJson(Map<String, dynamic> json) {
  return _FailureResponse.fromJson(json);
}

/// @nodoc
mixin _$FailureResponse {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailureResponseCopyWith<FailureResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureResponseCopyWith<$Res> {
  factory $FailureResponseCopyWith(
          FailureResponse value, $Res Function(FailureResponse) then) =
      _$FailureResponseCopyWithImpl<$Res, FailureResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureResponseCopyWithImpl<$Res, $Val extends FailureResponse>
    implements $FailureResponseCopyWith<$Res> {
  _$FailureResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FailureResponseImplCopyWith<$Res>
    implements $FailureResponseCopyWith<$Res> {
  factory _$$FailureResponseImplCopyWith(_$FailureResponseImpl value,
          $Res Function(_$FailureResponseImpl) then) =
      __$$FailureResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureResponseImplCopyWithImpl<$Res>
    extends _$FailureResponseCopyWithImpl<$Res, _$FailureResponseImpl>
    implements _$$FailureResponseImplCopyWith<$Res> {
  __$$FailureResponseImplCopyWithImpl(
      _$FailureResponseImpl _value, $Res Function(_$FailureResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FailureResponseImpl implements _FailureResponse {
  const _$FailureResponseImpl({required this.message});

  factory _$FailureResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FailureResponseImplFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'FailureResponse(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureResponseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureResponseImplCopyWith<_$FailureResponseImpl> get copyWith =>
      __$$FailureResponseImplCopyWithImpl<_$FailureResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FailureResponseImplToJson(
      this,
    );
  }
}

abstract class _FailureResponse implements FailureResponse {
  const factory _FailureResponse({required final String message}) =
      _$FailureResponseImpl;

  factory _FailureResponse.fromJson(Map<String, dynamic> json) =
      _$FailureResponseImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$FailureResponseImplCopyWith<_$FailureResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
