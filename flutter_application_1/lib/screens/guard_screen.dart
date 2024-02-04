import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class GuardScreen extends StatelessWidget {
  const GuardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Guard Dashboard'),
      body: Center(
        child: Text('Guard Dashboard'),
      ),
    );
  }
}
