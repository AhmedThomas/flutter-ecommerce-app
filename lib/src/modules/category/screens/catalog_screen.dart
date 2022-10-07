import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      appBar: CustomAppBar(
        title: category.name,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(
                child: Platform.isIOS
                    ? CupertinoActivityIndicator(color: AppColors.primary)
                    : CircularProgressIndicator(color: AppColors.primary));
          }
          if (state is ProductLoaded) {
            final List<Product> categoryProducts = state.products
                .where((product) => product.category == category.name)
                .toList();
            return GridView.builder(
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
            );
          } else {
            return const Center(child: Text(AppStrings.errorMessage));
          }
        },
      ),
      bottomNavigationBar: const HomeNavBar(),
    );
  }
}
