import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    List<User>? users,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? userName,
    String? email,
    int? phoneNumber,
    String? imageUrl,
    String? firstName,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
