import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/screens/qr_code_generator_screen.dart';
import 'package:flutter_application_1/models/student_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File? _profileImage;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _campusController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final List<String> roles = ['Student', 'Guard'];
  String? selectedRole;
  bool fieldsVisible = false;

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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 41, 115, 138),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Create Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

              const SizedBox(height: 16.0),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: _profileImage != null
                          ? CircleAvatar(
                              radius: 45,
                              backgroundImage: FileImage(_profileImage!),
                            )
                          : const Icon(Icons.add_a_photo, size: 40),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.center,
                child: DropdownButton<String>(
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
                      fieldsVisible = true;
                    });
                  },
                ),
              ),

              if (fieldsVisible) ...[
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
            Container(
              margin: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: selectedRole == null
                      ? null
                      : () {
                          if (selectedRole == 'Student') {
                            // Create an instance of StudentModel with the entered data
                            StudentModel student = StudentModel(
                              id: _idController.text,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              contactNumber: _contactNumberController.text,
                              campus: _campusController.text,
                              sex: _sexController.text,
                              status: _statusController.text,
                              laptopBrand: _laptopBrandController.text,
                              laptopModel: _modelController.text,
                              laptopSerialNumber: _serialNumberController.text,
                              role: selectedRole ?? 'student',
                            );

                            // Navigate to the QR code generator page and pass the student model
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    QrCodeGeneratorPage(student: student),
                              ),
                            );
                          } else {
                            // Handle the case where the role is not 'Student'
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Success'),
                                  content: const Text('Registration successfully!!!!!!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0,vertical: 16.0),
                    backgroundColor: Colors.purple[200],
                    textStyle: const TextStyle(fontSize: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    // Set the width to fit with the text fields
                    minimumSize: Size(double.infinity, 0),
                  ),
                  child: const Text('Register'),
                ),
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
