import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF40A2D8), // Top color (40A2D8)
              Color(0xFFF0EDCF), // Bottom color (F0EDCF)
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              _buildTextField('Email', _emailFocusNode),
              _buildTextField('Username', _usernameFocusNode),
              _buildTextField('Password', _passwordFocusNode, isPassword: true),
              _buildTextField('Confirm Password', _confirmPasswordFocusNode, isPassword: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement signup logic here
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, FocusNode focusNode, {bool isPassword = false}) {
    return Container(
      width: 300,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        focusNode: focusNode,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: focusNode.hasFocus ? Colors.blue : Colors.black,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
