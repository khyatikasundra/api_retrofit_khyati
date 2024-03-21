import 'dart:async';
import 'package:api_retrofit_project/core/error/exception.dart';
import 'package:api_retrofit_project/core/util/extensions.dart';
import 'package:api_retrofit_project/core/webservice/api_client.dart';
import 'package:api_retrofit_project/model/login_request_model.dart';
import 'package:api_retrofit_project/view/authentication/authentication_bloc.dart';
import 'package:api_retrofit_project/view/authentication/authentication_event.dart';
import 'package:api_retrofit_project/view/login/bloc/login_event.dart';
import 'package:api_retrofit_project/view/login/bloc/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;
  LoginBloc({required this.authenticationBloc}) : super(LoginInitialState()) {
    on<LoginButtonPressedEvent>(_loginButtonPressed);
  }

  FutureOr<void> _loginButtonPressed(
      LoginButtonPressedEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try {
      var request = LoginRequestModel(
          username: event.userName.trim(), password: event.password.trim());
      var response =
          await ApiClient.authenticateService.authenticateUser(request);
      if (response.isSuccessful) {
        authenticationBloc.add(LoggedInEvent(token: response.data.token));
      }
    } on Failure catch (e) {
      emit(LoginFailureState(errorMessage: e.message));
    } catch (e) {
      debugPrint(e.toString());
      emit(LoginFailureState(errorMessage: e.toString()));
    }
  }
}
