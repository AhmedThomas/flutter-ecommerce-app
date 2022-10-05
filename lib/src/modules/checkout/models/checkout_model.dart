// ignore_for_file: prefer_collection_literals

import 'package:equatable/equatable.dart';

import '../../export_modules.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  const Checkout({
    required this.fullName,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.zipCode,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        products,
        subtotal,
        deliveryFee,
        total,
      ];

  Map<String, Object> toDocument() {
    Map customerInfo = Map();
    customerInfo['fullName'] = fullName;
    customerInfo['email'] = email;
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;
    Map orderSummary = Map();
    orderSummary['subtotal'] = subtotal;
    orderSummary['deliveryFee'] = deliveryFee;
    orderSummary['total'] = total;

    return {
      'customerInfo': customerInfo,
      'customerAddress': customerAddress,
      'products': products!.map((product) => product.name).toList(),
      'orderSummary': orderSummary,
    };
  }
}
