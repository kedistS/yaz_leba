import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  File? _profileImage;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _campusController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final List<String> roles = ['Student', 'Guard'];
  String? selectedRole;
  bool fieldsVisible = false; // Added to control visibility of fields

  // Student-specific fields
  final TextEditingController _laptopBrandController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _serialNumberController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Register Users'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  _pickImage(ImageSource.gallery);
                },
                child: _profileImage != null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(_profileImage!),
                      )
                    : const CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.add_a_photo),
                      ),
              ),
              const SizedBox(height: 16.0),
              DropdownButton<String>(
                value: selectedRole,
                hint: const Text('Select Role'),
                items: roles.map((String role) {
                  return DropdownMenuItem<String>(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedRole = value;
                    fieldsVisible = true; // Show fields when a role is selected
                  });
                },
              ),
              if (fieldsVisible) // Only show fields if fieldsVisible is true
                ...[
                const SizedBox(height: 16.0),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _idController,
                  decoration: const InputDecoration(
                    labelText: 'ID',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _contactNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Contact Number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _campusController,
                  decoration: const InputDecoration(
                    labelText: 'Campus',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _sexController,
                  decoration: const InputDecoration(
                    labelText: 'Sex',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _statusController,
                  decoration: const InputDecoration(
                    labelText: 'Status',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                if (selectedRole != null && selectedRole == 'Student') ...[
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _laptopBrandController,
                    decoration: const InputDecoration(
                      labelText: 'Laptop Brand',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _modelController,
                    decoration: const InputDecoration(
                      labelText: 'Model',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _serialNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Serial Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ],
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your registration logic here
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.purple[100], // Text color
                    minimumSize: const Size(200, 50), // Button size
                  ),
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: RegisterPage(),
  ));
}
