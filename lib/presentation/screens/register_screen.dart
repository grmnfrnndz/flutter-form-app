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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            onChanged: (value) => username = value,
            validator: (String? value) {
              if (value == null || value.isEmpty) return 'Field Required';
              if (value.trim().isEmpty) return 'Field Required';
              if (value.length < 6) return 'Username must be greather length 6 characters';
              return null;
            },
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Email',
            onChanged: (value) => email = value,
            validator: (String? value) {
              if (value == null || value.isEmpty) return 'Field Required';
              if (value.trim().isEmpty) return 'Field Required';
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegExp.hasMatch(value)) return 'Email Invalid';

              return null;
            },
          ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Password',
            onChanged: (value) => password = value,
            validator: (String? value) {
              if (value == null || value.isEmpty) return 'Field Required';
              if (value.trim().isEmpty) return 'Field Required';
              if (value.length < 6) return 'Username must be greather length 6 characters';

              return null;
            },
            obscureText: true,
          ),
          

          const SizedBox(height: 20,),

          FilledButton.tonalIcon(onPressed: () {

            final isValid = _formKey.currentState!.validate();
            if (!isValid) return;

            print('$username - $password - $email');
          }, icon: const Icon(Icons.save), label: const Text('Create User'),),
        ],
      ),
    );
  }
}
