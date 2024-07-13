import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/admin_screen.dart';
import 'package:flutter_application_1/screens/guard_screen.dart';
import 'package:flutter_application_1/screens/student_screen.dart';
import 'package:flutter_application_1/screens/forgot_password_screen.dart'; // Import the Forgot Password screen
import 'package:flutter_application_1/widgets/app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Method to handle login logic
  void _login(BuildContext context, String username, String password) {
    // Here you would implement actual login logic
    // For demonstration purposes, let's assume successful login
    String role = 'student'; // Replace with actual role fetched from backend

    switch (role) {
      case 'admin':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AdminScreen()),
        );
        break;
      case 'guard':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const GuardScreen()),
        );
        break;
      case 'student':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const StudentScreen()),
        );
        break;
      default:
        // Handle invalid role or other error
        break;
    }
  }

  // Method to navigate to Forgot Password screen
  void _navigateToForgotPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    String username = '';
    String password = '';

    return Scaffold(
      appBar: const CustomAppBar(title: 'Login'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const SizedBox(height: 16.0),
            Center(
              child: ClipOval(
                child: Image(
                  image: AssetImage("images/logo2.jpg"),
                  width: 210, // Set the width of the circular image
                  height: 210, // Set the height of the circular image
                  fit: BoxFit.cover, // Ensure the image covers the circular area
                ),
              ),
            ),

            const SizedBox(height: 20), // Add some spacing
            TextField(
              onChanged: (value) => username = value, 
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => password = value,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context, username, password),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[100],
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10), // Add some spacing
            TextButton(
              onPressed: () => _navigateToForgotPassword(context),
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.blue[200], // Change text color to blue[200]
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
