// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../../../config/config.dart';
import '../../export_modules.dart';

class GooglePay extends StatelessWidget {
  const GooglePay({required this.products, required this.total, super.key});

  final String total;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    var _paymentItems = products
        .map(
          (product) => PaymentItem(
            label: product.name,
            amount: product.price.toString(),
            type: PaymentItemType.item,
            status: PaymentItemStatus.final_price,
          ),
        )
        .toList();

    _paymentItems.add(
      PaymentItem(
        label: 'Total',
        amount: total,
        type: PaymentItemType.total,
        status: PaymentItemStatus.final_price,
      ),
    );

    void onGooglePayResult(paymentResult) {
      debugPrint(paymentResult.toString());
    }

    return BottomAppBar(
      color: AppColors.primary,
      child: GooglePayButton(
        paymentConfigurationAsset: 'payment_profile_google_pay.json',
        onPaymentResult: onGooglePayResult,
        paymentItems: _paymentItems,
        type: GooglePayButtonType.pay,
        margin: const EdgeInsets.all(10),
        loadingIndicator: CircularProgressIndicator(color: AppColors.primary),
      ),
    );
  }
}
