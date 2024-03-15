import 'package:api_retrofit_project/view/authentication/authentication_bloc.dart';
import 'package:api_retrofit_project/view/login/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
  serviceLocator
      .registerFactory(() => LoginBloc(authenticationBloc: serviceLocator()));

  serviceLocator.registerLazySingleton(() => AuthenticationBloc());

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
}
