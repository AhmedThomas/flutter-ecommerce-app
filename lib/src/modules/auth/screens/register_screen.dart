import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';
import '../../export_modules.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.splashRoute),
      builder: (context) => const RegisterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'test'),
      body: Padding(
        padding: const EdgeInsets.all(AppSize.s20),
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return ListView(
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserInput(
                        onChanged: (value) {
                          context.read<RegisterCubit>().userChanged(
                              state.user!.copyWith(fullName: value));
                        },
                        labelText: 'Full Name'),
                    const SizedBox(height: 10),
                    UserInput(
                        onChanged: (value) {
                          context
                              .read<RegisterCubit>()
                              .userChanged(state.user!.copyWith(email: value));
                        },
                        labelText: 'Email'),
                    const SizedBox(height: 10),
                    _PasswordInput(),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fixedSize: const Size(200, 40),
                      ),
                      onPressed: () {
                        context.read<RegisterCubit>().registerWithCredentials();
                      },
                      child: const Text('REGISTER'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<RegisterCubit>().passwordChanged(password);
          },
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.grey)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.error)),
          ),
          obscureText: true,
        );
      },
    );
  }
}
