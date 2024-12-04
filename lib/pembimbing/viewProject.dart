import 'package:flutter/material.dart';

class ViewProjectPage extends StatelessWidget {
  ViewProjectPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Aplikasi Pendaftaran PKL',
      'description': 'Manajemen User, Pendaftaran, View Project, Upload Laporan Progress, Form Penilaian Akhir'
    },
    {
      'title': 'Aplikasi Pelaporan Bugs',
      'description': 'Pencatatan Bugs, Penugasan Perbaikan Bugs (DSI & Programmer), Pelacakan Progress Perbaikan Bugs'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Project'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(projects[index]['title'], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(projects[index]['description']),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                // Aksi saat tile diklik, misal navigasi ke detail proyek
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProjectPage(project: projects[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailProjectPage extends StatelessWidget {
  final Map<String, dynamic> project;

  const DetailProjectPage({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project['title']),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(project['description']),
            // Tambahkan lebih banyak informasi atau widget sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
