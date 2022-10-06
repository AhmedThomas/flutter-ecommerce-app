import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import '../../../config/config.dart';
import '../../export_modules.dart';

class PaymentSelection extends StatelessWidget {
  const PaymentSelection({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.paymentRoute),
      builder: (context) => const PaymentSelection(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.paymentTitle),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentLoading) {
            return Center(
                child: Platform.isIOS
                    ? CupertinoActivityIndicator(color: AppColors.primary)
                    : CircularProgressIndicator(color: AppColors.primary));
          }
          if (state is PaymentLoaded) {
            return ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                Platform.isIOS
                    ? RawApplePayButton(
                        style: ApplePayButtonStyle.black,
                        type: ApplePayButtonType.inStore,
                        onPressed: () {
                          context.read<PaymentBloc>().add(
                              const SelectPaymentMethod(
                                  paymentMethod: PaymentMethod.apple_pay));
                          Navigator.pop(context);
                        },
                      )
                    : const SizedBox(height: 10),
                const SizedBox(height: 10),
                Platform.isAndroid
                    ? RawGooglePayButton(
                        type: GooglePayButtonType.pay,
                        onPressed: () {
                          context.read<PaymentBloc>().add(
                              const SelectPaymentMethod(
                                  paymentMethod: PaymentMethod.google_pay));
                          Navigator.pop(context);
                        },
                      )
                    : const SizedBox(height: 10),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28))),
                  onPressed: () {
                    context.read<PaymentBloc>().add(const SelectPaymentMethod(
                        paymentMethod: PaymentMethod.credit_card));
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Text(
                      'Pay with Credit Card',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Text(AppStrings.errorMessage);
          }
        },
      ),
      bottomNavigationBar: const HomeNavBar(),
    );
  }
}
