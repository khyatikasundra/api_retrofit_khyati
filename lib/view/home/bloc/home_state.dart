import 'package:api_retrofit_project/model/profile_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState{}

class OnGetHomeInitialDataState extends HomeState {
  final ProfileModel profileModel;
  OnGetHomeInitialDataState({required this.profileModel});
}
class StateFailureState extends HomeState{
  final String errorMessage;
  final int? statusCode;
  StateFailureState({required this.errorMessage, this.statusCode});
}
