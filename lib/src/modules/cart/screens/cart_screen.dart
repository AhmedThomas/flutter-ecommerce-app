import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';
import '../../export_modules.dart';

class CartScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.cartRoute),
      builder: (context) => const CartScreen(),
    );
  }

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.cartTitle,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p12, vertical: AppPadding.p16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.cart.freeDeliveryString,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: AppColors.primary),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.homeRoute);
                            },
                            child: Text(
                              'Add More Items',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s12),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                            itemCount: state.cart
                                .productQuantity(state.cart.products)
                                .keys
                                .length,
                            itemBuilder: (context, index) {
                              return CartProductCard(
                                product: state.cart
                                    .productQuantity(state.cart.products)
                                    .keys
                                    .elementAt(index),
                                quantity: state.cart
                                    .productQuantity(state.cart.products)
                                    .values
                                    .elementAt(index),
                              );
                            }),
                      ),
                    ],
                  ),
                  const OrderSummary()
                ],
              ),
            );
          } else {
            return const Text(AppStrings.errorMessage);
          }
        },
      ),
      bottomNavigationBar: const CartNavBar(),
    );
  }
}
