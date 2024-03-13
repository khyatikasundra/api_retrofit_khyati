import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_add_response_model.freezed.dart';
part 'product_add_response_model.g.dart';

@freezed
class ProductAddResponseModel with _$ProductAddResponseModel {
  const factory ProductAddResponseModel({
    required int id,
    required String title,
  }) = _ProductAddResponseModel;

  factory ProductAddResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductAddResponseModelFromJson(json);
}
