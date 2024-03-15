import 'dart:async';

import 'package:api_retrofit_project/core/error/exception.dart';
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
    on<OnLoginButtonPressedEvent>(_loginButtonPressed);
  }

  FutureOr<void> _loginButtonPressed(
      OnLoginButtonPressedEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try {
      var request =
          LoginRequestModel(username: event.userName, password: event.password);
      var response =
          await ApiClient.authenticateService.authenticateUser(request);
      if ((response.response.statusCode ?? 0) >= 200 &&
          (response.response.statusCode ?? 0) < 300) {
        authenticationBloc.add(OnLoggedInEvent(token: response.data.token));
      } else {
        debugPrint("something went wrong");
      }
    } on Failure catch (e) {
      if (e.statusCode == null) {
        emit(LoginFailureState(errorMessage: e.message));
      }
      emit(
          LoginFailureState(errorMessage: e.message, statusCode: e.statusCode));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
