import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_product_event.dart';
part 'all_product_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  AllProductBloc() : super(AllProductInitial()) {
    on<AllProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
