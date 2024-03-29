import 'package:api_retrofit_project/model/profile_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class OnGetHomeInitialDataState extends HomeState {
  final ProfileModel profileModel;
  OnGetHomeInitialDataState({required this.profileModel});
}

class HomeFailureState extends HomeState {
  final String errorMessage;
  HomeFailureState({required this.errorMessage});
}
