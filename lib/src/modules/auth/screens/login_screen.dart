import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../export_modules.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.splashRoute),
      builder: (context) => const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSize.s20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const EmailInput(),
            const SizedBox(height: 10),
            const PasswordInput(),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                fixedSize: const Size(200, 40),
              ),
              onPressed: () {},
              child: const Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }
}
