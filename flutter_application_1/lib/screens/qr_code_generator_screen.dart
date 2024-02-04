import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_application_1/models/student_model.dart';

class QrCodeGeneratorPage extends StatelessWidget {
  final StudentModel student;

  const QrCodeGeneratorPage({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (student.role == 'Student') {
      String dataString =
          "${student.firstName},${student.lastName},${student.email},${student.contactNumber},${student.campus},${student.sex},${student.status},${student.laptopBrand},${student.laptopModel},${student.laptopSerialNumber}";
      return Scaffold(
        appBar: AppBar(
          title: const Text('QR Code Generator'),
        ),
        body: Center(
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
              ),
            ],
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
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the QR Code page
            },
            child: const Text('OK'),
          ),
        ],
      ),
    ),
  );
}
}
}
