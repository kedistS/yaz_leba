import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/admin_report_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  // Method to navigate to register users screen
  void _navigateToRegisterUsers(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  // Method to navigate to view reports screen
  void _navigateToViewReports(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReportPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Admin Dashboard'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _navigateToRegisterUsers(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ), // Button border
              ),
              child: const Text(
                'Register Users',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToViewReports(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green, // Text color
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ), // Button border
              ),
              child: const Text(
                'View Reports',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
