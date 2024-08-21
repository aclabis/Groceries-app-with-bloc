import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/blocs/whistlist/whistlist_bloc.dart';
import 'package:groceries_app/blocs/whistlist/whistlist_event.dart';
import 'package:groceries_app/blocs/whistlist/whistlist_state.dart';
import 'package:groceries_app/widgets/whitlisted_widget.dart';

class WhistlistScreen extends StatelessWidget {
  const WhistlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final whistListbloc = context.read<WhistlistBloc>();
    whistListbloc.add(WhistlistInitialEvent());
    return BlocConsumer<WhistlistBloc, WhistlistState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is WhistListSuccessState) {
          final products = state.whistlistItem;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text(
                "Whistlist",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final data = products[index];

                return WhitlistedWidget(
                  image: products[index].imageUrl,
                  name: data.name,
                  description: data.description,
                  price: data.price,
                );
              },
            ),
          );
        } else {
          return const Center(child: Text("No whistlisted item "));
        }
      },
    );
  }
}
