import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  // Method to handle reporting stolen PC
  void _reportStolenPC(BuildContext context) {
    // Implement your logic to report stolen PC here
    // For demonstration purposes, we'll show a dialog
    TextEditingController commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Report Stolen PC',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your PC has been reported as stolen.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Additional Comments (Optional):',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: commentController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Enter any additional information here...',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Retrieve additional comments entered by the student
                String comments = commentController.text;
                // Implement your logic to report stolen PC here, along with additional comments
                // For now, just close the dialog
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Change button color to blue
              ),
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Student Dashboard'),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You can report a stolen PC here by clicking the button below.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _reportStolenPC(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[100], // Change button color to blue
                ),
                child: const Text('Report Stolen PC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
