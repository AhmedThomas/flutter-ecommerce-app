import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../export_modules.dart';

class CategoryScreen extends StatelessWidget {
  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.catalogRoute),
      builder: (context) => CategoryScreen(category: category),
    );
  }

  final Category category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
          vertical: AppPadding.p16,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.15,
        ),
        itemCount: categoryProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ProductsCard(
              product: categoryProducts[index],
              widthFactor: 2.2,
            ),
          );
        },
      ),
      bottomNavigationBar: const HomeNavBar(),
    );
  }
}
