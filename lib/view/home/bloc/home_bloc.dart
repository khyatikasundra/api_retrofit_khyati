import 'dart:async';

import 'package:api_retrofit_project/core/error/exception.dart';
import 'package:api_retrofit_project/core/webservice/api_client.dart';
import 'package:api_retrofit_project/view/home/bloc/home_event.dart';
import 'package:api_retrofit_project/view/home/bloc/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<GetHomeInitialDataEvent>(_homeInitialData);
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
}
