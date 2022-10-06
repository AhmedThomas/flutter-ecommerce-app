// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../../../config/config.dart';
import '../../export_modules.dart';

class ApplePay extends StatelessWidget {
  const ApplePay({required this.products, required this.total, super.key});

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

    void onApplePayResult(paymentResult) {
      debugPrint(paymentResult.toString());
    }

    return BottomAppBar(
      color: AppColors.primary,
      child: ApplePayButton(
        paymentConfigurationAsset: 'payment_profile_apple_pay.json',
        onPaymentResult: onApplePayResult,
        paymentItems: _paymentItems,
        style: ApplePayButtonStyle.white,
        type: ApplePayButtonType.inStore,
        margin: const EdgeInsets.all(10),
        loadingIndicator: CupertinoActivityIndicator(color: AppColors.primary),
      ),
    );
  }
}
