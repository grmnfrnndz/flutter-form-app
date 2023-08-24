import 'package:flutter/material.dart';
import 'package:form_app/presentation/widgets/widgets.dart';


class RegisterScreen extends StatelessWidget {

  static String name = 'register_screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New User')
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlutterLogo(size: 100,),

                _RegisterForm(),
                               
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Email',
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Password',
            obscureText: true,
          ),
          

          const SizedBox(height: 20,),

          FilledButton.tonalIcon(onPressed: () {}, icon: const Icon(Icons.save), label: const Text('Create User'),),
        ],
      ),
    );
  }
}
