import 'dart:async';

import 'package:api_retrofit_project/core/error/exception.dart';
import 'package:api_retrofit_project/core/webservice/api_client.dart';
import 'package:api_retrofit_project/view/authentication/authentication_bloc.dart';
import 'package:api_retrofit_project/view/authentication/authentication_event.dart';
import 'package:api_retrofit_project/view/home/bloc/home_event.dart';
import 'package:api_retrofit_project/view/home/bloc/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationBloc authenticationBloc;
  HomeBloc({required this.authenticationBloc}) : super(HomeInitialState()) {
    on<GetHomeInitialDataEvent>(_homeInitialData);
    on<GetLogoutButtonPressedEvent>(_logoutButtonPressed);
  }

  FutureOr<void> _homeInitialData(
      GetHomeInitialDataEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      var response = await ApiClient.profileService.fetchProfileDetail();
      emit(OnGetHomeInitialDataState(profileModel: response.data));
    } on Failure catch (e) {
      if (e.statusCode == null) {
        emit(StateFailureState(errorMessage: e.message));
      }
      emit(
          StateFailureState(errorMessage: e.message, statusCode: e.statusCode));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  FutureOr<void> _logoutButtonPressed(
      GetLogoutButtonPressedEvent event, Emitter<HomeState> emit) {
    authenticationBloc.add(OnLogoutEvent());
  }
}
