import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showInputValues(){
    String email = _emailController.text;
    String password = _passwordController.text;
  }

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
              _buildTextInput('Email', Icons.email, _emailController),
              SizedBox(height: 25,),
              _buildTextInput('Password', Icons.password, _passwordController),
              SizedBox(height: 25,),
              _buildRegisterButton(),
              SizedBox(height: 25,),
              _buildLoginPrompt(),
            ],
          ),
        ),
      )
    );
  }

  Widget _buildRegisterButton(){
    return ElevatedButton(
      onPressed: _showInputValues, 
      style: ElevatedButton.styleFrom(
        backgroundColor: DefaultColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        padding: EdgeInsets.symmetric(vertical: 15)
      ),
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white),
      ),

    );
  }

  Widget _buildLoginPrompt(){
    return Center(
      child: GestureDetector(
        onTap: (){
          
        },
        child: RichText(
          text: TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(color: Colors.grey),
            children: [
              TextSpan(
                text: 'Create new one',
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextInput( String hint, IconData icon, TextEditingController controller, {bool isPassword = false}){
    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.sentMessageInput,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none
              ),
              style: TextStyle(color: Colors.white)
            )
          )
        ],
      ),
    );
  }

}