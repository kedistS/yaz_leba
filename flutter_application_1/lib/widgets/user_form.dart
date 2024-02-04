import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  const UserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: 'Username'),
        ),
        TextFormField(
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
      ],
    );
  }
}
