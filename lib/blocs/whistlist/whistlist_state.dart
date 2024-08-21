import 'package:equatable/equatable.dart';
import 'package:groceries_app/model/data_model.dart';

abstract class WhistlistState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WhistlistInitialState extends WhistlistState {}

class WhistListSuccessState extends WhistlistState {
  final List<ProductDataModel> whistlistItem;

  WhistListSuccessState({required this.whistlistItem});
  @override
  List<Object?> get props => [whistlistItem];
}
