import 'package:flutter/material.dart';

class NewsPost {
  final String journalistName;
  final String date;
  final String content;

  NewsPost({
    required this.journalistName,
    required this.date,
    required this.content,
  });
}

class Posts extends StatelessWidget {
  // Exemple de données de news
  final List<NewsPost> newsPosts = [
    NewsPost(
      journalistName: "John Doe",
      date: "10 mars 2024",
      content:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut elit ut sem eleifend accumsan. Nam dapibus ultricies mi a vestibulum.",
    ),
    NewsPost(
      journalistName: "Jane Smith",
      date: "11 mars 2024",
      content:
      "Sed vehicula accumsan velit, a consequat nunc pharetra eget. Vestibulum bibendum tortor sit amet ligula maximus tincidunt.",
    ),
    NewsPost(
      journalistName: "Alice Johnson",
      date: "12 mars 2024",
      content:
      "Fusce euismod tellus ac justo consectetur, sit amet mattis mi ultricies. Vivamus finibus felis quis libero efficitur fringilla.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Table',
      theme: ThemeData.light().copyWith(
        primaryColor: Color.fromARGB(255, 206, 70, 165),
        hintColor: Color.fromARGB(255, 184, 79, 128),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'News Table',
            style: TextStyle(color: Colors.white),
          ),
          // Ajouter un bouton de retour à la page précédente
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Liste des News',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 212, 96, 206),
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 16.0,
                  headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blueAccent.withOpacity(0.2)),
                  dataRowColor: MaterialStateColor.resolveWith((states) => Colors.blueAccent.withOpacity(0.1)),
                  columns: [
                    DataColumn(
                      label: Text(
                        'Journaliste',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 209, 68, 164),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 209, 68, 164),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Contenu',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 209, 68, 164),
                        ),
                      ),
                    ),
                  ],
                  rows: newsPosts.map((news) {
                    return DataRow(cells: [
                      DataCell(Text(news.journalistName, style: TextStyle(color: Colors.black))),
                      DataCell(Text(news.date, style: TextStyle(color: Colors.black))),
                      DataCell(Text(news.content, style: TextStyle(color: Colors.black))),
                    ]);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}