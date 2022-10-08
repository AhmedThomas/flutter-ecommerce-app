import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/config.dart';
import '../../export_modules.dart';

class UserInput extends StatelessWidget {
  const UserInput({
    super.key,
    required this.onChanged,
    required this.labelText,
  });

  final Function(String)? onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.grey)),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.error),
            ),
          ),
        );
      },
    );
  }
}
