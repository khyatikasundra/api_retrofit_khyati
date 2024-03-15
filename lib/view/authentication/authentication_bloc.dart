import 'dart:async';

import 'package:api_retrofit_project/view/authentication/authentication_event.dart';
import 'package:api_retrofit_project/view/authentication/authentication_state.dart';
import 'package:bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<OnLoggedInEvent>(_onLoggedIn);
    on<NAppStarted>(_onAppStarted);
  }

  FutureOr<void> _onLoggedIn(
      OnLoggedInEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationAuthenticated());
  }

  FutureOr<void> _onAppStarted(event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationUnauthenticated());
  }
}
