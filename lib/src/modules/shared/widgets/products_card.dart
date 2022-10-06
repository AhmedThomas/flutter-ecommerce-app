import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';
import '../../export_modules.dart';

class ProductsCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductsCard({
    Key? key,
    required this.product,
    this.widthFactor = AppSize.s2_5,
    this.leftPosition = AppSize.s5,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productRoute,
            arguments: product);
      },
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: widthValue,
            height: AppSize.s125,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: AppSize.s60,
            left: leftPosition,
            child: Container(
              width: widthValue - 5 - leftPosition,
              height: AppSize.s80,
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: AppSize.s65,
            left: leftPosition + 5,
            child: Container(
              width: widthValue - 15 - leftPosition,
              height: AppSize.s70,
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            '${AppStrings.egCurrency}${product.price}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.secondary,
                            ),
                          );
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(AddProduct(product));
                                const snackBar = SnackBar(
                                    content: Text(AppStrings.addedCart));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: Icon(
                                Icons.add_circle,
                                color: AppColors.secondary,
                              ),
                            ),
                          );
                        } else {
                          return const Text(AppStrings.errorMessage);
                        }
                      },
                    ),
                    isWishlist
                        ? Expanded(
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<WishlistBloc>()
                                    .add(RemoveProductFromWishlist(product));
                              },
                              icon: Icon(
                                Icons.delete,
                                color: AppColors.secondary,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
