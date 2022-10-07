import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../export_modules.dart';
import 'base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;
  final UserRepository _userRepository;

  AuthRepository({
    auth.FirebaseAuth? firebaseAuth,
    required UserRepository userRepository,
  })  : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
        _userRepository = userRepository;

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

  @override
  Future<auth.User?> register({
    required User user,
    required String password,
  }) async {
    try {
      _firebaseAuth
          .createUserWithEmailAndPassword(
            email: user.email,
            password: password,
          )
          .then(
            (value) => _userRepository.creatUser(
              user.copyWith(id: value.user!.uid),
            ),
          );
    } catch (_) {}
  }

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {}
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
