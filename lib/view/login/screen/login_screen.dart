import 'package:api_retrofit_project/core/constant/text_style.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

//! widget lifecycle method
  @override
  void initState() {
    _loginBloc = context.read<LoginBloc>();
    super.initState();
  }

//! build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollWidget(
        child: _blocConsumer(),
      ),
    );
  }

  //!widget methods

  Widget _blocConsumer() => BlocConsumer<LoginBloc, LoginState>(
        listener: _listener,
        builder: _builder,
      );

  Widget _builder(context, state) => Container(
        decoration: TextStyles.getBackgroundImageBoxDecoration(),
        child: _padding(),
      );

  Widget _padding() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: _loginForm(),
      );

  Widget _loginForm() => Form(
        key: _formKey,
        child: LoginForm(
          userNameController: userNameController,
          passwordController: passwordController,
          onLoginButtonPressed: _loginButtonOnPressed,
        ),
      );

  //! listener
  void _listener(context, state) {
    if (state is LoginFailureState) {
      _snackBar(context, state);
    }
  }

  //!functions

  void _snackBar(context, LoginFailureState state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.errorMessage),
        duration: const Duration(seconds: 10),
      ),
    );
  }

  void _loginButtonOnPressed() {
    if (_formKey.currentState!.validate()) {
      _loginBloc.add(
        LoginButtonPressedEvent(
            userName: userNameController.text,
            password: passwordController.text),
      );
    }
  }
}
