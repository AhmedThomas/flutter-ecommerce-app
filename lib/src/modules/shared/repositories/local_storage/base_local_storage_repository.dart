import 'package:hive_flutter/hive_flutter.dart';

import '../../../export_modules.dart';

abstract class BaseLocalStorageRepository {
  // wishlist box
  Future<Box> openWishlistBox();
  List<Product> getWishlist(Box box);
  Future<void> addProductToWishlist(Box box, Product product);
  Future<void> removeProductFromWishlist(Box box, Product product);
  Future<void> clearWishlist(Box box);

  // cart box
  Future<Box> openCartBox();
  List<Product> getCart(Box box);
  Future<void> addProductToCart(Box box, Product product);
  Future<void> removeProductFromCart(Box box, Product product);
  Future<void> clearCart(Box box);
}
