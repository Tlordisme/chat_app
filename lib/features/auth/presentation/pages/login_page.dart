// import 'package:chat_app/core/theme.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:chat_app/features/auth/presentation/widgets/auth_input.dart';
import 'package:chat_app/features/auth/presentation/widgets/login_prompt.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // void _showInputValues() {
  //   String email = _emailController.text;
  //   String password = _passwordController.text;
  // }

  @override
  void dispose() {
    _emailController.dispose();

    _passwordController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthInput(
                hint: 'Email',
                icon: Icons.email,
                controller: _emailController,
              ),
              // _buildTextInput('Email', Icons.email, _emailController),
              SizedBox(height: 25),
              AuthInput(
                hint: 'Password',
                icon: Icons.password,
                controller: _passwordController,
              ),

              // _buildTextInput('Password', Icons.password, _passwordController),
              SizedBox(height: 25),
              AuthButton(text: 'Sign Up', onPressed: () {}),
              // _buildRegisterButton(),
              SizedBox(height: 25),
              LoginPrompt(
                onTap: () {},
                title: "Don't have an account? ",
                title2: "Create a new one",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
