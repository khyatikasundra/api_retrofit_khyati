import 'package:api_retrofit_project/gen/assets.gen.dart';
import 'package:api_retrofit_project/ui_component/custom_scroll_widget/custom_scroll_widget.dart';
import 'package:api_retrofit_project/view/login/bloc/login_bloc.dart';
import 'package:api_retrofit_project/view/login/bloc/login_event.dart';
import 'package:api_retrofit_project/view/login/bloc/login_state.dart';
import 'package:api_retrofit_project/view/login/widget/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc = context.read<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: CustomScrollWidget(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text("${state.errorMessage} ${state.statusCode ?? ''}"),
                duration: const Duration(seconds: 10),
              ));
            }
          },
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Assets.images.sunflower.path),
              )),
              child: Form(
                  child: LoginForm(
                emailController: emailController,
                passwordController: passwordController,
                onLoginButtonPressed: () => _loginBloc.add(
                    OnLoginButtonPressedEvent(
                        userName: emailController.text,
                        password: passwordController.text)),
              )),
            );
          },
        ),
      ),
    );
  }
}
