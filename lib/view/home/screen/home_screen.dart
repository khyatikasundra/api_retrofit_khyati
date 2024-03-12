import 'package:api_retrofit_project/model/product_model.dart';
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
  List<Product> _productList = [];
  @override
  void initState() {
    _homeBloc = context.read<HomeBloc>();
    _homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitialDataState) {
            _productList = state.productModel.products;
          }
          return state is HomeLoading
              ? const CircularProgressIndicator()
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: ElevatedButton(
                        child: Text("Post"),
                        onPressed: () {},
                      ),
                    ),
                    SliverList.builder(
                        itemCount: _productList.length,
                        itemBuilder: (context, index) => ListTile(
                              leading: Text(_productList[index].id.toString()),
                              title: Text(_productList[index].title),
                              subtitle:
                                  Text(_productList[index].price.toString()),
                              trailing:
                                  Image.network(_productList[index].images[0]),
                            ))
                  ],
                );
        },
      )),
    );
  }
}
