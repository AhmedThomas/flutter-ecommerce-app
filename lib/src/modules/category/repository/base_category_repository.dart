import '../../export_modules.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
