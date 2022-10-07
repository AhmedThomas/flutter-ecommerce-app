import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(AppSize.s20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserInput(onChanged: (value) {}, labelText: 'Full Name'),
            const SizedBox(height: 10),
            UserInput(onChanged: (value) {}, labelText: 'Email'),
            UserInput(onChanged: (value) {}, labelText: 'Country'),
            const SizedBox(height: 10),
            UserInput(onChanged: (value) {}, labelText: 'City'),
            const SizedBox(height: 10),
            UserInput(onChanged: (value) {}, labelText: 'Adress'),
            const SizedBox(height: 10),
            UserInput(onChanged: (value) {}, labelText: 'Zip Code'),
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
              child: const Text('REGISTER'),
            ),
          ],
        ),
      ),
    );
  }
}
