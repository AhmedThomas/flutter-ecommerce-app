import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';
import '../../export_modules.dart';

class SplashScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.splashRoute),
      builder: (context) => const SplashScreen(),
    );
  }

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, AppRoutes.homeRoute));
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.authUser != current.authUser,
      listener: (context, state) {
        print('splash screen auth listener');
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                width: AppSize.s125,
                height: AppSize.s125,
              ),
            ),
            const SizedBox(
              height: AppSize.s28,
            ),
            Text(
              AppStrings.splashTitle,
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
