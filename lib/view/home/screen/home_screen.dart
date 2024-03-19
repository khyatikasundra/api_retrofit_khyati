import 'package:api_retrofit_project/core/constant/strings.dart';
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
  List<User> _users = [];
  @override
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    _homeBloc.add(GetHomeInitialDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: _listener,
          builder: _builder,
        ));
  }

  void _listener(context, state) {
    if (state is StateFailureState) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${state.errorMessage} ${state.statusCode ?? ''}"),
        duration: const Duration(seconds: 10),
      ));
    }
  }

  Widget _builder(context, state) {
    if (state is OnGetHomeInitialDataState) {
      _users = state.profileModel.users ?? [];
    }
    return SafeArea(
        child: Center(
            child: state is HomeLoadingState
                ? const CircularProgressIndicator()
                : _listBuilder()));
  }

  Widget _listBuilder() {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(_users[index].userName ?? ""),
                ))
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(Strings.labelString.kHome),
      actions: [
        IconButton(
            onPressed: () {
              _homeBloc.add(GetLogoutButtonPressedEvent());
            },
            icon: const Icon(Icons.logout_rounded))
      ],
    );
  }
}
