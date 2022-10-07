import 'package:flutter/material.dart';

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
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(labelText: labelText),
    );
  }
}
