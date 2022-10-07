import '../../../export_modules.dart';

abstract class BaseUserRepository {
  Stream<User> getUser(String userId);
  Future<void> creatUser(User user);
  Future<void> updateUser(User user);
}
