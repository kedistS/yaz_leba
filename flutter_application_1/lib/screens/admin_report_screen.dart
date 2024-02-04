import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/app_bar.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String? selectedOption;

  final List<String> reportOptions = [
    'See Registered Students',
    'See Registered Guards',
    'See Today\'s Report',
  ];

  List<Map<String, String>> studentData = [
    // Student data
    // Add more student data as needed
    {
      'FirstName': 'Hawi',
      'LastName': 'Tulu',
      'Role': 'Student',
      'ProfilePicture': 'url_to_image',
      'ContactNumber': '1234567890',
      'Campus': 'CNCS',
      'Sex': 'Female',
      'Status': 'Active',
      'PC_Brand': 'Brand X',
      'PC_Model': 'Model Y',
      'PC_SerialNumber': '123ABC',
      'RegistrationDate': '2022-02-02',
    }
  ];

  List<Map<String, String>> guardData = [
    // Guard data
    // Add more guard data as needed
  ];

  List<Map<String, String>> todayReportData = [
    // Today's report data
    // Add more today's report data as needed
  ];

  Widget selectedWidget = Container();

  @override
  Widget build(BuildContext context) {
    selectedWidget =
        _buildStudentInfoTable(studentData); // Set a default widget
    if (selectedOption == 'See Registered Students') {
      selectedWidget = _buildStudentInfoTable(studentData);
    } else if (selectedOption == 'See Registered Guards') {
      selectedWidget = _buildGuardInfoTable(guardData);
    } else if (selectedOption == 'See Today\'s Report') {
      selectedWidget = _buildTodayReportTable(todayReportData);
    }

    return Scaffold(
      appBar: const CustomAppBar(title: 'Reports'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: selectedOption,
              hint: const Text('Select an option'),
              items: reportOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Expanded(child: selectedWidget),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentInfoTable(List<Map<String, String>> data) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('FirstName')),
          DataColumn(label: Text('LastName')),
          DataColumn(label: Text('Role')),
          DataColumn(label: Text('ProfilePicture')),
          DataColumn(label: Text('ContactNumber')),
          DataColumn(label: Text('Campus')),
          DataColumn(label: Text('Sex')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('PC_Brand')),
          DataColumn(label: Text('PC_Model')),
          DataColumn(label: Text('PC_SerialNumber')),
          DataColumn(label: Text('RegistrationDate')),
        ],
        rows: data.map((Map<String, String> entry) {
          return DataRow(
            cells: [
              DataCell(Text(entry['FirstName'] ?? '')),
              DataCell(Text(entry['LastName'] ?? '')),
              DataCell(Text(entry['Role'] ?? '')),
              DataCell(Text(entry['ProfilePicture'] ?? '')),
              DataCell(Text(entry['ContactNumber'] ?? '')),
              DataCell(Text(entry['Campus'] ?? '')),
              DataCell(Text(entry['Sex'] ?? '')),
              DataCell(Text(entry['Status'] ?? '')),
              DataCell(Text(entry['PC_Brand'] ?? '')),
              DataCell(Text(entry['PC_Model'] ?? '')),
              DataCell(Text(entry['PC_SerialNumber'] ?? '')),
              DataCell(Text(entry['RegistrationDate'] ?? '')),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildGuardInfoTable(List<Map<String, String>> data) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('FirstName')),
          DataColumn(label: Text('LastName')),
          DataColumn(label: Text('Role')),
          DataColumn(label: Text('ProfilePicture')),
          DataColumn(label: Text('ContactNumber')),
          DataColumn(label: Text('Campus')),
          DataColumn(label: Text('Sex')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('RegistrationDate')),
        ],
        rows: data.map((Map<String, String> entry) {
          return DataRow(
            cells: [
              DataCell(Text(entry['FirstName'] ?? '')),
              DataCell(Text(entry['LastName'] ?? '')),
              DataCell(Text(entry['Role'] ?? '')),
              DataCell(Text(entry['ProfilePicture'] ?? '')),
              DataCell(Text(entry['ContactNumber'] ?? '')),
              DataCell(Text(entry['Campus'] ?? '')),
              DataCell(Text(entry['Sex'] ?? '')),
              DataCell(Text(entry['Status'] ?? '')),
              DataCell(Text(entry['RegistrationDate'] ?? '')),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTodayReportTable(List<Map<String, String>> data) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('EventType')),
          DataColumn(label: Text('PersonName')),
          DataColumn(label: Text('Role')),
          DataColumn(label: Text('EventDate')),
        ],
        rows: data.map((Map<String, String> entry) {
          return DataRow(
            cells: [
              DataCell(Text(entry['EventType'] ?? '')),
              DataCell(Text(entry['PersonName'] ?? '')),
              DataCell(Text(entry['Role'] ?? '')),
              DataCell(Text(entry['EventDate'] ?? '')),
            ],
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ReportPage(),
  ));
}
