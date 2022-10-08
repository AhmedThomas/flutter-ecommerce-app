import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';
import '../../export_modules.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              fixedSize: const Size(200, 40),
              side: BorderSide(color: AppColors.primary)),
          onPressed: () {
            context.read<LoginCubit>().logInWithGoogle();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/google.png',
                width: 30,
              ),
              const SizedBox(width: 5),
              Text(
                'Login with Google',
                style: TextStyle(color: AppColors.primary),
              ),
            ],
          ),
        );
      },
    );
  }
}
