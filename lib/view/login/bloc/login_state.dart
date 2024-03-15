import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class OnGetAuthenticatedSuccessful extends LoginState {
  final String name;
  final int id;
  OnGetAuthenticatedSuccessful({required this.id, required this.name});
}

class LoginFailureState extends LoginState {
  final String errorMessage;
  final int? statusCode;
  LoginFailureState({required this.errorMessage, this.statusCode});
}
