import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<int> {
  CartCubit() : super(0);

  void addToCart() => emit(state + 1);
}
