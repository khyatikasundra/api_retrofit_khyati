import 'package:api_retrofit_project/model/profile_model.dart';
import 'package:api_retrofit_project/view/home/bloc/home_bloc.dart';
import 'package:api_retrofit_project/view/home/bloc/home_event.dart';
import 'package:api_retrofit_project/view/home/bloc/home_state.dart';
import 'package:api_retrofit_project/view/home/widget/home_app_bar.dart';
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

//! widget lifecycle method
  @override
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    _homeBloc.add(GetUserListEvent());
    super.initState();
  }

//! build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _blockConsumer(),
    );
  }

  //! methods
  HomeAppBar _appBar() =>
      HomeAppBar(onLogoutButtonPressed: _onLogoutButtonPressed);

  BlocConsumer<HomeBloc, HomeState> _blockConsumer() {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: _listener,
      builder: _builder,
    );
  }

  Widget _builder(context, state) {
    if (state is OnGetHomeInitialDataState) {
      _users = state.profileModel.users ?? [];
    }
    return SafeArea(
      child: Center(
        child: state is HomeLoadingState
            ? const CircularProgressIndicator()
            : _listBuilder(),
      ),
    );
  }

  Widget _listBuilder() {
    return ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(_users[index].userName ?? ""),
            ));
  }

  //! listener
  void _listener(context, state) {
    if (state is HomeFailureState) {
      _snackBar(context, state);
    }
  }

  //! function
  void _snackBar(context, HomeFailureState state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.errorMessage),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _onLogoutButtonPressed() {
    _homeBloc.add(LogoutButtonPressedEvent());
  }
}
