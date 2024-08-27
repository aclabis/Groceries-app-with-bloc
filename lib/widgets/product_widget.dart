import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:groceries_app/blocs/home/home_bloc.dart';
import 'package:groceries_app/blocs/home/home_events.dart';
import 'package:groceries_app/model/data_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductDataModel productmodel;
  final HomeBloc homeBloc;
  const ProductWidget({
    super.key,
    required this.productmodel,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(productmodel.imageUrl))),
          ),
          const SizedBox(height: 20),
          Text(productmodel.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
           Text(productmodel.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" + productmodel.price.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(
                          HomeProductwhitllistButtonClickedEvent(
                              whitlistclicked: productmodel),
                        );
                        // homeBloc.add(HomeShowSnackBarEvent());
                      },
                      icon:const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
