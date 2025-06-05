import 'package:bloc_login_page/Bloc/login_bloc.dart';
import 'package:bloc_login_page/Bloc/login_event.dart';
import 'package:bloc_login_page/Bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(create: (context) => LoginBloc(), child: Login()),
    );
  }
}

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController UserName = TextEditingController();
  final TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Bloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Login Using BlocListener')),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Login Failed')));
          } else if (state is LoginSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Login Success')));
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: UserName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: Password,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 10),
                (state is Loading)
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                      onPressed: () {
                        Bloc.add(
                          ButtonPressed(
                            UserName: UserName.text,
                            Password: Password.text,
                          ),
                        );
                      },
                      child: const Text('Login'),
                    ),
              ],
            );
          },
        ),
      ),
    );
  }
}
