import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/config.dart';
import '../../../widgets/widgets.dart';
import '../../export_modules.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.orderConfirmRoute),
      builder: (context) => const OrderConfirmation(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.orderConfirmTitle),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: AppColors.primary,
                  width: double.infinity,
                  height: AppSize.s300,
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  top: 125,
                  child: SvgPicture.asset('assets/svgs/garlands.svg'),
                ),
                Positioned(
                  top: 250,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    AppStrings.orderComplete,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: AppColors.secondary),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Code #312-ac13',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Thank you for purchasing on Our App.',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Order Code #312-ac13',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: AppColors.primary),
                  ),
                  const OrderSummary(),
                  const SizedBox(height: 20),
                  Text(
                    'Order Details',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: AppColors.primary),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 5),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      OrderSummaryProductCard(
                        product: Product.products[0],
                        quantity: 2,
                      ),
                      OrderSummaryProductCard(
                        product: Product.products[4],
                        quantity: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const HomeNavBar(),
    );
  }
}
