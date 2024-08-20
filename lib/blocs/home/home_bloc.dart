import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:groceries_app/blocs/home/home_events.dart';
import 'package:groceries_app/blocs/home/home_states.dart';
import 'package:groceries_app/data/cart_data.dart';
import 'package:groceries_app/data/grocery_data.dart';
import 'package:groceries_app/data/whitlist_data.dart';
import 'package:groceries_app/model/data_model.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductwhitllistButtonClickedEvent>(
        homeProductwhitllistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeStates> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(HomeLoadedState(
      products: GroceryData.groceryProducts
          .map((e) => ProductDataModel(
              id: e['id'],
              name: e['name'],
              description: e['description'],
              price: e['price'],
              imageUrl: e['imageUrl']))
          .toList(),
    ));
  }

  FutureOr<void> homeProductwhitllistButtonClickedEvent(
      HomeProductwhitllistButtonClickedEvent event, Emitter<HomeStates> emit) {
    whitlistItem.add(event.whitlistclicked);
    emit(whitlistItemAddedstate());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeStates> emit) {
    cartItem.add(event.cartclicked);
    emit(cartItemAdedstate());
  }
}
