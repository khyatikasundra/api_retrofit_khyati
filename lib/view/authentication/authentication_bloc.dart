import 'dart:async';

import 'package:api_retrofit_project/core/shared_preference_helper.dart';
import 'package:api_retrofit_project/view/authentication/authentication_event.dart';
import 'package:api_retrofit_project/view/authentication/authentication_state.dart';
import 'package:bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<OnLoggedInEvent>(_onLoggedIn);
    on<OnAppStarted>(_onAppStarted);
    on<OnLogoutEvent>(_onLogout);
  }

  FutureOr<void> _onLoggedIn(
      OnLoggedInEvent event, Emitter<AuthenticationState> emit) async {
    await SharedPreferenceHelper.setToken(event.token);
    emit(AuthenticationAuthenticated());
  }

  FutureOr<void> _onAppStarted(event, Emitter<AuthenticationState> emit) async {
    var token = await SharedPreferenceHelper.getToken();
    if ((token ?? '').isNotEmpty) {
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }

  FutureOr<void> _onLogout(
      OnLogoutEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await SharedPreferenceHelper.clear();
    print("emit");
    emit(AuthenticationUnauthenticated());
  }
}
