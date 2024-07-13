// student_model.dart

class StudentModel {
  final String id;
  final String firstName;
  final String lastName;
  //final String email;
  String? role;
  final String contactNumber;
  final String campus;
  final String sex;
  final String status;
  final String laptopBrand;
  final String laptopModel;
  final String laptopSerialNumber;

  // Add other fields as needed

  StudentModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    //required this.email,
    required this.role,
    required this.contactNumber,
    required this.campus,
    required this.sex,
    required this.status,
    required this.laptopBrand,
    required this.laptopModel,
    required this.laptopSerialNumber,

    // Add other fields as needed
  });
}
