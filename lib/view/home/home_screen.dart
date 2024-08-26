import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/blocs/home/home_bloc.dart';
import 'package:groceries_app/blocs/home/home_events.dart';
import 'package:groceries_app/blocs/home/home_states.dart';
import 'package:groceries_app/view/whitlist/whistlist_screen.dart';
import 'package:groceries_app/widgets/product_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    homeBloc.add(HomeInitialEvent());
    return BlocConsumer<HomeBloc, HomeStates>(
      bloc: homeBloc,
      listener: (context, state) {
        if (state is HomeShowSnackBarState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Product is whistlisted")));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadedState) {
          final products = state.products;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                "Groceries App",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => WhistlistScreen()));
                  },
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_bag_outlined,
                      color: Colors.white),
                )
              ],
            ),
            body: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductWidget(
                  productmodel: products[index],
                  homeBloc: homeBloc,
                );
              },
            ),
          );
        } else if (state is HomeLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text("Something went wrong!"));
        }
      },
    );
  }
}
