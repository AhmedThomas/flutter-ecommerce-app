import 'package:flutter/material.dart';

import '../config/config.dart';
import '../modules/export_modules.dart';
import 'widgets.dart';

class ProductsCarousel extends StatelessWidget {
  final List<Product> products;

  const ProductsCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: AppSize.s165,
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20,
            vertical: AppPadding.p10,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                right: AppPadding.p5,
              ),
              child: ProductsCard(
                product: products[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
