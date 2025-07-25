import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:short_flow_bloc/bloc/login_bloc.dart';
import 'package:short_flow_bloc/bloc/login_event.dart';
import 'package:short_flow_bloc/bloc/login_state.dart';
import 'package:short_flow_bloc/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          } else if (state.errorMessage != null) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            return Column(
              children: [
                TextField(
                  onChanged: (value) => bloc.add(EmailChanged(value)),
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  onChanged: (value) => bloc.add(PasswordChanged(value)),
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                state.isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          bloc.add(LoginSubmitted());
                        }, child: const Text('Login'))
              ],
            );
          }),
        ),
      ),
    );
  }
}
