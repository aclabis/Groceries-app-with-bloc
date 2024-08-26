import 'package:equatable/equatable.dart';
import 'package:groceries_app/model/data_model.dart';

class HomeStates extends Equatable {
  @override
  List<Object?> get props => [];
}
class HomeInitialState extends HomeStates{}

class HomeActionState extends HomeStates{}

class HomeLoadingState extends HomeStates {}

class HomeLoadedState extends HomeStates {
  final List<ProductDataModel> products;

  HomeLoadedState({required this.products});
  @override
  List<Object?> get props => [products];
}

class HomeErrorState extends HomeStates {}


class whitlistItemAddedstate extends HomeStates {}

class cartItemAdedstate extends HomeStates {}

class HomeShowSnackBarState extends HomeActionState{}