import 'package:flutter/material.dart';

class VerificationDocument {
  final String journalistName;
  final String id;
  final String documentType;
  final String documentNumber;

  VerificationDocument({
    required this.journalistName,
    required this.id,
    required this.documentType,
    required this.documentNumber,
  });
}

class VerificationTable extends StatelessWidget {
  final List<VerificationDocument> documents = [
    VerificationDocument(
      journalistName: "John Doe",
      id: "JD123",
      documentType: "Passeport",
      documentNumber: "123456789",
    ),
    VerificationDocument(
      journalistName: "Jane Smith",
      id: "JS456",
      documentType: "CIN",
      documentNumber: "987654321",
    ),
    VerificationDocument(
      journalistName: "Alice Johnson",
      id: "AJ789",
      documentType: "Passeport",
      documentNumber: "456789123",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vérification des Documents'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 227, 48, 156),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Liste des Documents',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: documents.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        title: Text(
                          documents[index].journalistName,
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID: ${documents[index].id}'),
                            Text('Type de Document: ${documents[index].documentType}'),
                            Text('Numéro de Document: ${documents[index].documentNumber}'),
                          ],
                        ),
                        onTap: () {
                          // Add onTap functionality here
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

