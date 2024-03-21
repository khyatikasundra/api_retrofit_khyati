import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginButtonPressedEvent extends LoginEvent {
  final String userName;
  final String password;

  LoginButtonPressedEvent({
    required this.userName,
    required this.password,
  });
}
