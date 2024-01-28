import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'signup_page.dart';// Assuming HomePage.dart exists for sign-up page

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to ChargeConnect',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'MyCustomFont',
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 200, // Adjust the width as needed
                  height: 50, // Adjust the height as needed
                  child: AnimatedButton(
                    label: 'Login',
                    onPressed: () {
                      // Handle login button press
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 200, // Adjust the width as needed
                  height: 50, // Adjust the height as needed
                  child: AnimatedButton(
                    label: 'Sign Up',
                    onPressed: () {
                      // Handle sign-up button press
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()), // Replace SignUpPage with your sign-up page
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// AnimatedButton Widget
class AnimatedButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  AnimatedButton({required this.label, required this.onPressed});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _isPressed ? Colors.blue.shade800 : Colors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
