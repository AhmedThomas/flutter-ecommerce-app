import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../export_modules.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final LocalStorageRepository _localStorageRepository;

  CartBloc({required LocalStorageRepository localStorageRepository})
      : _localStorageRepository = localStorageRepository,
        super(CartLoading()) {
    on<LoadCart>(_onLoadCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  void _onLoadCart(event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      Box box = await _localStorageRepository.openCartBox();
      List<Product> products = _localStorageRepository.getCart(box);
      // await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded(
        cart: Cart(products: products),
      ));
    } catch (_) {
      emit(CartError());
    }
  }

  void _onAddProduct(event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        Box box = await _localStorageRepository.openCartBox();
        _localStorageRepository.addProductToCart(box, event.product);
        emit(
          CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(event.product)),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }

  void _onRemoveProduct(event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        Box box = await _localStorageRepository.openCartBox();
        _localStorageRepository.removeProductFromCart(box, event.product);
        emit(
          CartLoaded(
            cart: Cart(
                products: List.from(state.cart.products)
                  ..remove(event.product)),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }
}
