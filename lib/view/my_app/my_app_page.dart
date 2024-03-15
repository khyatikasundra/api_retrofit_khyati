import 'package:api_retrofit_project/injection_container.dart';
import 'package:api_retrofit_project/view/authentication/authentication_bloc.dart';
import 'package:api_retrofit_project/view/my_app/my_app_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => serviceLocator<AuthenticationBloc>(),
      child: const MyAppScreen(),
    );
  }
}
