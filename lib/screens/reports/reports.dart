import 'package:flutter/material.dart';

class Report {
  final String id;
  final String type;
  final String reporter;
  final String details;

  Report({
    required this.id,
    required this.type,
    required this.reporter,
    required this.details,
  });
}

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  String _selectedReportType = 'All';
  List<Report> reports = [
    Report(
      id: "1",
      type: "Post",
      reporter: "John Doe",
      details: "Inappropriate content",
    ),
    Report(
      id: "2",
      type: "Comment",
      reporter: "Jane Smith",
      details: "Spam",
    ),
    Report(
      id: "3",
      type: "Journalist",
      reporter: "Alice Johnson",
      details: "Misinformation",
    ),
    // Add more reports as needed
  ];

  List<Report> getFilteredReports() {
    if (_selectedReportType == 'All') {
      return reports;
    } else {
      return reports.where((report) => report.type == _selectedReportType).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Repports',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 227, 48, 156),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonFormField<String>(
              value: _selectedReportType,
              items: <String>['All', 'Post', 'Comment', 'Journalist']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 132, 20, 93),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedReportType = newValue!;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 64, 63, 63),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: 'Filter by Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: getFilteredReports().length,
              itemBuilder: (context, index) {
                Report report = getFilteredReports()[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 68, 66, 66),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        'ID: ${report.id}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Type: ${report.type}'),
                          Text('Reporter: ${report.reporter}'),
                          Text('Details: ${report.details}'),
                        ],
                      ),
                      onTap: () {
                        // Handle tap on report
                      },
                      trailing: Icon(Icons.arrow_forward, color: Colors.blueAccent),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

