part of 'register_cubit.dart';

enum RegisterStatus { intial, submitting, success, error }

class RegisterState extends Equatable {
  final String password;
  final RegisterStatus status;
  final auth.User? authUser;
  final User? user;

  bool get isFormValid => user!.email.isNotEmpty && password.isNotEmpty;

  const RegisterState({
    required this.password,
    required this.status,
    this.authUser,
    this.user,
  });

  factory RegisterState.initial() {
    return const RegisterState(
      password: '',
      status: RegisterStatus.intial,
      authUser: null,
      user: User(),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [password, status, authUser, user];

  RegisterState copyWith({
    String? password,
    RegisterStatus? status,
    auth.User? authUser,
    User? user,
  }) {
    return RegisterState(
      password: password ?? this.password,
      status: status ?? this.status,
      authUser: authUser ?? this.authUser,
      user: user ?? this.user,
    );
  }
}
