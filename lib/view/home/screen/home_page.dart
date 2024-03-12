import 'package:api_retrofit_project/view/home/bloc/home_bloc.dart';
import 'package:api_retrofit_project/view/home/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: const HomeScreen(),
    );
  }
}
