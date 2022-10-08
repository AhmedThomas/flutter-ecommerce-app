import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';
import '../../export_modules.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: AppRoutes.profileRoute),
      builder: (context) => BlocProvider(
        create: (context) => ProfileBloc(
          authBloc: context.read<AuthBloc>(),
          userRepository: context.read<UserRepository>(),
        )..add(
            LoadProfile(context.read<AuthBloc>().state.authUser),
          ),
        child: const ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.profileTitle),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
                child: Platform.isIOS
                    ? CupertinoActivityIndicator(color: AppColors.primary)
                    : CircularProgressIndicator(color: AppColors.primary));
          }
          if (state is ProfileLoaded) {
            return Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(200, 40),
                ),
                onPressed: () {
                  context.read<AuthRepository>().signOut();
                },
                child: const Text('Sign Out'),
              ),
            );
          }
          if (state is ProfileUnauthenticated) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'You\'re not logged in.',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fixedSize: const Size(200, 40),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.loginRoute);
                  },
                  child: const Text('LOGIN'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: const Size(200, 40),
                      side: BorderSide(color: AppColors.primary)),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.registerRoute);
                  },
                  child: Text(
                    'REGISTER',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text(AppStrings.errorMessage));
          }
        },
      ),
      bottomNavigationBar: const HomeNavBar(),
    );
  }
}
