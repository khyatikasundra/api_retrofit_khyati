import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    required int id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String gender,
    required String image,
    required String token,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
