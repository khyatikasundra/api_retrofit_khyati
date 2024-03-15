import 'package:api_retrofit_project/injection_container.dart';
import 'package:api_retrofit_project/view/login/bloc/login_bloc.dart';
import 'package:api_retrofit_project/view/login/screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocProvider<LoginBloc>(
        create: (context) => serviceLocator<LoginBloc>(),
        child: const LoginScreen(),
      ),
    );
  }
}
