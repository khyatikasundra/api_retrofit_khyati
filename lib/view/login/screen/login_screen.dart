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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _loginBloc = context.read<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollWidget(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: _listener,
          builder: (context, state) => Container(
            decoration: _backgroundImage(),
            child: _loginForm(emailController, passwordController),
          ),
        ),
      ),
    );
  }

  void _listener(context, state) {
    if (state is LoginFailureState) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${state.errorMessage} ${state.statusCode ?? ''}"),
        duration: const Duration(seconds: 10),
      ));
    }
  }

  BoxDecoration _backgroundImage() {
    return BoxDecoration(
        image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage(Assets.images.sunflower.path),
    ));
  }

  Form _loginForm(TextEditingController emailController,
      TextEditingController passwordController) {
    return Form(
        key: _formKey,
        child: LoginForm(
          emailController: emailController,
          passwordController: passwordController,
          onLoginButtonPressed: _loginButtonOnPressed,
        ));
  }

  void _loginButtonOnPressed() {
    if (_formKey.currentState!.validate()) {
      _loginBloc.add(OnLoginButtonPressedEvent(
          userName: emailController.text, password: passwordController.text));
    }
  }
}
