import 'package:api_retrofit_project/view/authentication/authentication_bloc.dart';
import 'package:api_retrofit_project/view/authentication/authentication_event.dart';
import 'package:api_retrofit_project/view/authentication/authentication_state.dart';
import 'package:api_retrofit_project/view/home/screen/home_page.dart';
import 'package:api_retrofit_project/view/login/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppScreen extends StatefulWidget {
  const MyAppScreen({super.key});

  @override
  State<MyAppScreen> createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  late AuthenticationBloc _authenticationBloc;
  @override
  void initState() {
    _authenticationBloc = context.read<AuthenticationBloc>();
    _authenticationBloc.add(OnAppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: _builder),
      ),
    );
  }

  Widget _builder(BuildContext context, AuthenticationState state) {
    if (state is AuthenticationAuthenticated) {
      return const HomePage();
    }
    if (state is AuthenticationUnauthenticated) {
      return const LoginPage();
    }
    return const LoginPage();
  }
}
