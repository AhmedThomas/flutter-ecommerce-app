import '../../export_modules.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
