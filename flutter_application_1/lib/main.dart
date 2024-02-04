import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set LoginScreen as the initial route
      initialRoute: '/login',
      routes: {
        // Define named routes for each screen
        '/login': (context) => const LoginScreen(),
        // Add other routes here
      },
    );
  }
}
