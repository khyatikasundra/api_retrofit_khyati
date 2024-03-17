import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnLoggedInEvent extends AuthenticationEvent {
  final String token;
  OnLoggedInEvent({required this.token});
}
class OnAppStarted extends AuthenticationEvent{}