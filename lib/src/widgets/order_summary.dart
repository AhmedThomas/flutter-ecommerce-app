import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/config.dart';
import '../modules/export_modules.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Column(
            children: [
              const Divider(thickness: AppSize.s2),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p40, vertical: AppPadding.p10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SUBTOTAL',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeightManager.medium),
                        ),
                        Text(
                          '${AppStrings.egCurrency}${state.cart.subtotalString}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeightManager.medium),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DELIVERY FEE',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeightManager.medium),
                        ),
                        Text(
                          '${AppStrings.egCurrency}${state.cart.deliveryFeeString}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeightManager.medium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: AppSize.s60,
                    decoration:
                        BoxDecoration(color: AppColors.primary.withAlpha(50)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: AppSize.s50,
                    margin: const EdgeInsets.all(AppMargin.m5),
                    decoration: BoxDecoration(color: AppColors.primary),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOTAL',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontWeight: FontWeightManager.medium),
                          ),
                          Text(
                            '${AppStrings.egCurrency}${state.cart.totalString}',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontWeight: FontWeightManager.medium),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const Text(AppStrings.errorMessage);
        }
      },
    );
  }
}
