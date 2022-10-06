import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';
import '../../export_modules.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.primary,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.homeRoute);
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.cartRoute);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.userRoute);
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductNavBar extends StatelessWidget {
  const ProductNavBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.primary,
      child: SizedBox(
        height: AppSize.s70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: AppColors.secondary,
              ),
            ),
            BlocBuilder<WishlistBloc, WishlistState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    context
                        .read<WishlistBloc>()
                        .add(AddProductToWishlist(product));

                    const snackBar =
                        SnackBar(content: Text(AppStrings.addedToWishlist));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: AppColors.secondary,
                  ),
                );
              },
            ),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                    ),
                  ),
                  onPressed: () {
                    context.read<CartBloc>().add(AddProduct(product));
                    Navigator.pushNamed(context, AppRoutes.cartRoute);
                  },
                  child: Text(AppStrings.addToCart.toUpperCase(),
                      style: Theme.of(context).textTheme.headline3),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CartNavBar extends StatelessWidget {
  const CartNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.primary,
      child: SizedBox(
        height: AppSize.s70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.checkoutRoute);
              },
              child: Text(AppStrings.goToCheckout.toUpperCase(),
                  style: Theme.of(context).textTheme.headline3),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutNavBar extends StatelessWidget {
  const CheckoutNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutLoading) {
          return Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator(color: AppColors.primary)
                  : CircularProgressIndicator(color: AppColors.primary));
        }
        if (state is CheckoutLoaded) {
          if (Platform.isIOS) {
            switch (state.paymentMethod) {
              case PaymentMethod.apple_pay:
                return ApplePay(
                  products: state.products!,
                  total: state.total!,
                );
              case PaymentMethod.credit_card:
                return Container(
                  color: AppColors.primary,
                  child: Center(
                    child: Text(
                      'Pay with Credit Card',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              default:
                return ApplePay(
                  products: state.products!,
                  total: state.total!,
                );
            }
          }
          if (Platform.isAndroid) {
            switch (state.paymentMethod) {
              case PaymentMethod.apple_pay:
                return GooglePay(
                  products: state.products!,
                  total: state.total!,
                );
              case PaymentMethod.credit_card:
                return Container(
                  color: AppColors.primary,
                  height: 56,
                  child: Center(
                    child: Text(
                      'Pay with Credit Card',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              default:
                return GooglePay(
                  products: state.products!,
                  total: state.total!,
                );
            }
          } else {
            return ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.paymentRoute);
                },
                child: Text(
                  'CHOOSE PAYMENT',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: AppColors.secondary),
                ));
          }
        } else {
          return const Text(AppStrings.errorMessage);
        }
      },
    );
  }
}
