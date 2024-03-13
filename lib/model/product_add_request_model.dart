import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_add_request_model.freezed.dart';
part 'product_add_request_model.g.dart';

@freezed
class ProductAddRequestModel with _$ProductAddRequestModel {
    const factory ProductAddRequestModel({
        required String title,
    }) = _ProductAddRequestModel;
    factory ProductAddRequestModel.fromJson(Map<String, dynamic> json) => _$ProductAddRequestModelFromJson(json);
}