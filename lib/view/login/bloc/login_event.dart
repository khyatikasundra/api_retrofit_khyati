import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnLoginButtonPressedEvent extends LoginEvent {
  final String userName;
  final String password;

  OnLoginButtonPressedEvent({required this.userName, required this.password,});
}
