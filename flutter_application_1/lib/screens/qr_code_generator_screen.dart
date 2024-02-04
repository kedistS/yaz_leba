import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_application_1/models/student_model.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class QrCodeGeneratorPage extends StatelessWidget {
  final StudentModel student;

  const QrCodeGeneratorPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    if (student.role == 'Student') {
      String dataString =
          "${student.firstName},${student.lastName},${student.contactNumber},${student.campus},${student.sex},${student.status},${student.laptopBrand},${student.laptopModel},${student.laptopSerialNumber}";
      return Scaffold(
        appBar: const CustomAppBar(title: 'Scan QR Code'),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                QrImageView(
                  data: dataString,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Scan this QR Code to view student information',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Registration Successful'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Registration successful.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the QR Code page
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0), backgroundColor: Colors.purple[
                      200], // Set button background color to purple[200]
                  textStyle: const TextStyle(fontSize: 16.0), // Set button text style
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(20.0), // Set button border radius
                  ),
                ),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      );
    }
  }
}
