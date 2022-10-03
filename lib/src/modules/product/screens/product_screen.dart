import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../widgets/widgets.dart';
import '../../export_modules.dart';

class ProductScreen extends StatelessWidget {
  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.productRoute),
      builder: (context) => ProductScreen(product: product),
    );
  }

  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: product.name,
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
            items: [HeroCarouselCard(product: product)],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: AppSize.s60,
                  alignment: Alignment.bottomCenter,
                  color: AppColors.primary.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(AppMargin.m5),
                  width: MediaQuery.of(context).size.width - 10,
                  height: AppSize.s50,
                  color: AppColors.primary,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          '${AppStrings.egCurrency}${product.price}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                AppStrings.productInfo,
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    AppStrings.productMockDescription,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                AppStrings.deliveryInfo,
                style: Theme.of(context).textTheme.headline3,
              ),
              children: [
                ListTile(
                  title: Text(
                    AppStrings.productMockDescription,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ProductNavBar(product: product),
    );
  }
}
