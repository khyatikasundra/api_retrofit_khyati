import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoggedInEvent extends AuthenticationEvent {
  final String token;
  LoggedInEvent({required this.token});
}

class AppStartedEvent extends AuthenticationEvent {}

class LogoutEvent extends AuthenticationEvent {}
