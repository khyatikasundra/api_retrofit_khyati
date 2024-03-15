import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure_response.freezed.dart';
part 'failure_response.g.dart';

@freezed
class FailureResponse with _$FailureResponse {
  const factory FailureResponse({
    required String message,
  }) = _FailureResponse;

  factory FailureResponse.fromJson(Map<String, dynamic> json) =>
      _$FailureResponseFromJson(json);
}
