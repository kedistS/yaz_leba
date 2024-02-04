import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';
import 'package:flutter_application_1/screens/qr_code_scanner.dart'; // Import your QR Code Scanner page

class GuardScreen extends StatelessWidget {
  const GuardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Guard Dashboard'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Guard Dashboard'),
            ElevatedButton(
              onPressed: () {
                // Navigate to the QR Code Scanner page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QrCodeScannerPage(),
                  ),
                );
              },
              child: Text('Scan QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}
