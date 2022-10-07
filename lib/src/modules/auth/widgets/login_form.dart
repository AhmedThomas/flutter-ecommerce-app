import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (email) {},
      decoration: const InputDecoration(labelText: 'Email'),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (password) {},
      decoration: const InputDecoration(labelText: 'Password'),
      obscureText: true,
    );
  }
}
