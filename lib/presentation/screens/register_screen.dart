import 'package:flutter/material.dart';


class RegisterScreen extends StatelessWidget {

  static String name = 'register_screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New User')
      ),
      body: const Placeholder(),
    );
  }
}