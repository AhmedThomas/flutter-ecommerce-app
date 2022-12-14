import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../export_modules.dart';

abstract class BaseAuthRepository {
  Stream<auth.User?> get user;

  Future<auth.User?> register({
    required User user,
    required String password,
  });

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> loginWithGoogle();

  Future<void> signOut();
}
