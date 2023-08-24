import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/presentation/blocs/register/register_cubit.dart';
import 'package:form_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static String name = 'register_screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New User')),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              ),
            ],
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

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Username',
            onChanged: (value) {
              registerCubit.usernameChanged(value);
              _formKey.currentState!.validate();
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) return 'Field Required';
              if (value.trim().isEmpty) return 'Field Required';
              if (value.length < 6)
                return 'Username must be greather length 6 characters';
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Email',
            onChanged: (value) {
              registerCubit.emailChanged(value);
              _formKey.currentState!.validate();
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) return 'Field Required';
              if (value.trim().isEmpty) return 'Field Required';
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegExp.hasMatch(value)) return 'Email Invalid';

              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Password',
            onChanged: (value) {
              registerCubit.passwordChanged(value);
              _formKey.currentState!.validate();
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) return 'Field Required';
              if (value.trim().isEmpty) return 'Field Required';
              if (value.length < 6)
                return 'Username must be greather length 6 characters';

              return null;
            },
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;

              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Create User'),
          ),
        ],
      ),
    );
  }
}
