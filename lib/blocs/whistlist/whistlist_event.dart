import 'package:equatable/equatable.dart';
import 'package:groceries_app/model/data_model.dart';

abstract class WhistlistEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WhistlistInitialEvent extends WhistlistEvent {}

class WHistlistRemoveEvent extends WhistlistEvent {
  final ProductDataModel products;

  WHistlistRemoveEvent({required this.products});
  @override
  List<Object?> get props => [];
}
