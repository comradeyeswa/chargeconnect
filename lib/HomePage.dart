import 'package:flutter/material.dart';
import'signup_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _imageSize = 200.0; // Initial size of the image

  bool _isEmailHovered = false;
  bool _isPasswordHovered = false;

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
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Zoom in when tapped
                setState(() {
                  _imageSize = 150.0;
                });
              },
              onTapCancel: () {
                // Zoom out when tap is canceled
                setState(() {
                  _imageSize = 100.0;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: _imageSize,
                height: _imageSize,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(75),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75),
                  child: Image.asset(
                    'assets/icon.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  _isEmailHovered = value;
                });
              },
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: _isEmailHovered ? Colors.blue.withOpacity(0.1) : Colors.white,
                ),
                style: TextStyle(color: Colors.black), // Set font color to black
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  _isPasswordHovered = value;
                });
              },
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: _isPasswordHovered ? Colors.blue.withOpacity(0.1) : Colors.white,
                ),
                style: TextStyle(color: Colors.black), // Set font color to black
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle login button press
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            Text(
              "Don't have an account?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
                // Handle navigation to signup page
              },
              child: Text(
                'Sign Up here',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
