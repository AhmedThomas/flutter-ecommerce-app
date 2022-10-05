import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../export_modules.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final PaymentBloc _paymentBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _paymentSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required PaymentBloc paymentBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        _paymentBloc = paymentBloc,
        _checkoutRepository = checkoutRepository,
        super(cartBloc.state is CartLoaded
            ? CheckoutLoaded(
                products: (cartBloc.state as CartLoaded).cart.products,
                subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
                deliveryFee:
                    (cartBloc.state as CartLoaded).cart.deliveryFeeString,
                total: (cartBloc.state as CartLoaded).cart.totalString,
              )
            : CheckoutLoading()) {
    on<UpdateCheckout>(_onUpdateCheckout);
    on<ConfirmCheckout>(_onConfirmCheckout);

    _cartSubscription = _cartBloc.stream.listen((state) {
      if (state is CartLoaded) {
        add(UpdateCheckout(cart: state.cart));
      }
    });

    _paymentSubscription = _paymentBloc.stream.listen((state) {
      if (state is PaymentLoaded) {
        add(UpdateCheckout(paymentMethod: state.paymentMethod));
      }
    });
  }

  void _onUpdateCheckout(
    UpdateCheckout event,
    Emitter<CheckoutState> emit,
  ) {
    final state = this.state;
    if (state is CheckoutLoaded) {
      emit(
        CheckoutLoaded(
          email: event.email ?? state.email,
          fullName: event.fullName ?? state.fullName,
          products: event.cart?.products ?? state.products,
          subtotal: event.cart?.subtotalString ?? state.subtotal,
          deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
          total: event.cart?.totalString ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
          country: event.country ?? state.country,
          zipCode: event.zipCode ?? state.zipCode,
          paymentMethod: event.paymentMethod ?? state.paymentMethod,
        ),
      );
    }
  }

  void _onConfirmCheckout(
    ConfirmCheckout event,
    Emitter<CheckoutState> emit,
  ) async {
    final state = this.state;
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        emit(CheckoutLoading());
      } catch (_) {}
    }
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    _paymentSubscription?.cancel();
    return super.close();
  }
}
