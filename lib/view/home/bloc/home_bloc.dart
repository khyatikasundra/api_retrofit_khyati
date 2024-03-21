import 'dart:async';

import 'package:api_retrofit_project/core/error/exception.dart';
import 'package:api_retrofit_project/core/util/extensions.dart';
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
    on<GetUserListEvent>(_homeInitialData);
    on<LogoutButtonPressedEvent>(_logoutButtonPressed);
  }

  FutureOr<void> _homeInitialData(
      GetUserListEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      var response = await ApiClient.profileService.fetchProfileDetail();
      if (response.isSuccessful) {
        emit(OnGetHomeInitialDataState(profileModel: response.data));
      }
    } on Failure catch (e) {
      emit(HomeFailureState(errorMessage: e.message));
    } catch (e) {
      debugPrint(e.toString());
      emit(HomeFailureState(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _logoutButtonPressed(
      LogoutButtonPressedEvent event, Emitter<HomeState> emit) {
    authenticationBloc.add(LogoutEvent());
  }
}
