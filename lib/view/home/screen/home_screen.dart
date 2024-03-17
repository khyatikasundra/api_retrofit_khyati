import 'package:api_retrofit_project/model/profile_model.dart';
import 'package:api_retrofit_project/view/home/bloc/home_bloc.dart';
import 'package:api_retrofit_project/view/home/bloc/home_event.dart';
import 'package:api_retrofit_project/view/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _homeBloc;
  ProfileModel _profileModel = const ProfileModel();
  @override
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    _homeBloc.add(GetHomeInitialDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is StateFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("${state.errorMessage} ${state.statusCode ?? ''}"),
            duration: const Duration(seconds: 10),
          ));
        }
      },
      builder: (context, state) {
        if (state is OnGetHomeInitialDataState) {
          _profileModel = state.profileModel;
        }

        return SafeArea(
            child: Center(
                child: state is HomeLoadingState
                    ? const CircularProgressIndicator()
                    : Text(_profileModel.email ?? '')));
      },
    ));
  }
}
