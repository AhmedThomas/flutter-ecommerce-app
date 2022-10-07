import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../export_modules.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(RegisterState.initial());

  void userChanged(User user) {
    emit(state.copyWith(
      user: user,
      status: RegisterStatus.intial,
    ));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(
      password: value,
      status: RegisterStatus.intial,
    ));
  }

  Future<void> registerWithCredentials() async {
    if (!state.isFormValid || state.status == RegisterStatus.submitting) return;
    emit(state.copyWith(status: RegisterStatus.submitting));
    try {
      var authUser = await _authRepository.register(
        password: state.password,
        user: state.user!,
      );
      emit(state.copyWith(status: RegisterStatus.success, authUser: authUser));
    } catch (_) {}
  }
}
