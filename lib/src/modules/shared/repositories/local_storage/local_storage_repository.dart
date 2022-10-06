import 'package:hive/hive.dart';

import '../../../export_modules.dart';
import 'base_local_storage_repository.dart';

class LocalStorageRepository extends BaseLocalStorageRepository {
  String wishlistBoxName = 'wishlist_products';
  String cartBoxName = 'cart_products';
  Type boxType = Product;

  @override
  Future<Box> openWishlistBox() async {
    Box box = await Hive.openBox<Product>(wishlistBoxName);
    return box;
  }

  @override
  List<Product> getWishlist(Box box) {
    return box.values.toList() as List<Product>;
  }

  @override
  Future<void> addProductToWishlist(Box box, Product product) async {
    await box.put(product.id, product);
  }

  @override
  Future<void> removeProductFromWishlist(Box box, Product product) async {
    await box.delete(product.id);
  }

  @override
  Future<void> clearWishlist(Box box) async {
    await box.clear();
  }

  @override
  Future<Box> openCartBox() async {
    Box box = await Hive.openBox<Product>(cartBoxName);
    return box;
  }

  @override
  List<Product> getCart(Box box) {
    return box.values.toList() as List<Product>;
  }

  @override
  Future<void> addProductToCart(Box box, Product product) async {
    await box.put(product.id, product);
  }

  @override
  Future<void> removeProductFromCart(Box box, Product product) async {
    await box.delete(product.id);
  }

  @override
  Future<void> clearCart(Box box) async {
    await box.clear();
  }
}
