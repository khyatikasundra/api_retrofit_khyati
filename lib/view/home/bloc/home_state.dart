import 'package:api_retrofit_project/model/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoading extends HomeState {}

class HomeInitialDataState extends HomeState {
  final ProductModel productModel;
  HomeInitialDataState({required this.productModel});
}
