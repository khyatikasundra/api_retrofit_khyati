import 'dart:async';

import 'package:api_retrofit_project/core/webservice/api_client.dart';
import 'package:api_retrofit_project/view/home/bloc/home_event.dart';
import 'package:api_retrofit_project/view/home/bloc/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(_getInitialHomeData);
  }

  FutureOr<void> _getInitialHomeData(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    var response = await ApiClient.productListService.fetchProductListing();
    emit(HomeInitialDataState(productModel: response.data));
  }
}
