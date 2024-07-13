import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  // Method to handle password reset logic
  void _resetPassword(BuildContext context) {
    // Add your password reset logic here
    // For demonstration purposes, let's assume password reset is successful
    // Navigator.pop(context); // Navigate back to login screen after reset
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Forgot Password'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("images/reset-password.png"),
              width: 200, // Set the width of the image
              height: 200, // Set the height of the image
            ),
            const SizedBox(height: 20),
            const Text(
              'Forgot Your Password?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle sending verification code and changing password
                _resetPassword(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[400], // Button background color
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Send Verification Code',
                style: TextStyle(
                  fontSize: 18.0,
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
