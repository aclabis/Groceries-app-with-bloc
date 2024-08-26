import 'package:equatable/equatable.dart';
import 'package:groceries_app/model/data_model.dart';

abstract class HomeEvents extends Equatable {
  const HomeEvents();
  @override
  List<Object?> get props => [];
}

class HomeInitialEvent extends HomeEvents {}

class HomeProductwhitllistButtonClickedEvent extends HomeEvents {
  final ProductDataModel whitlistclicked;

  const HomeProductwhitllistButtonClickedEvent({required this.whitlistclicked});
  @override
  List<Object?> get props => [whitlistclicked];
}

class HomeProductCartButtonClickedEvent extends HomeEvents {
  final ProductDataModel cartclicked;

  const HomeProductCartButtonClickedEvent({required this.cartclicked});
  @override
  List<Object?> get props => [cartclicked];
}

class HomeShowSnackBarEvent extends HomeEvents {}
