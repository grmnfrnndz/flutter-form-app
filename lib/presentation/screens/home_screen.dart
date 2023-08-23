import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {

  static String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubit'),
            subtitle: const Text('Simple Manager State'),
            trailing: const Icon(Icons.arrow_back_ios_outlined),
            onTap: () {
              context.push('/cubit');
            },
          ),
          ListTile(
            title: const Text('Bloc'),
            subtitle: const Text('Compound Manager State'),
            trailing: const Icon(Icons.arrow_back_ios_outlined),
            onTap: () {
              context.push('/bloc');
            },
          ),
          ListTile(
            title: const Text('Register User'),
            subtitle: const Text('handling form'),
            trailing: const Icon(Icons.arrow_back_ios_outlined),
            onTap: () {
              context.push('/register_user');
            },
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          )
        ],
      ),
    );
  }
}

