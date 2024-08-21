import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:groceries_app/blocs/whistlist/whistlist_event.dart';
import 'package:groceries_app/blocs/whistlist/whistlist_state.dart';
import 'package:groceries_app/data/whitlist_data.dart';

class WhistlistBloc extends Bloc<WhistlistEvent, WhistlistState> {
  WhistlistBloc() : super(WhistlistInitialState()) {
    on<WhistlistInitialEvent>(whistListIitalEvent);
    on<WHistlistRemoveEvent>(whistListRemoveEvent);
  }

  FutureOr<void> whistListIitalEvent(
      WhistlistInitialEvent event, Emitter<WhistlistState> emit) {
    emit(WhistListSuccessState(whistlistItem: whitlistItem));
  }

  FutureOr<void> whistListRemoveEvent(
      WHistlistRemoveEvent event, Emitter<WhistlistState> emit) {
    whitlistItem.remove(event.products);
    emit(WhistListSuccessState(whistlistItem: whitlistItem));
  }
}
