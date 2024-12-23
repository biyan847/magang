import 'package:flutter/material.dart';

class ViewProjectPage2 extends StatelessWidget {
  const ViewProjectPage2({super.key});

  @override
  Widget build(BuildContext context) {
    // Data projek (simulasi)
    final List<Map<String, String>> projects = [
      {
        'name': 'Aplikasi Pendaftaran PKL',
        'features':
            'Manajemen User, Pendaftaran, View Project, Upload Laporan Progress, Form Penilaian Akhir',
      },
      {
        'name': 'Aplikasi Pelaporan Bugs',
        'features':
            'Pencatatan Bugs, Penugasan Perbaikan Bugs (DSI & Programmer), Pelacakan Progress Perbaikan Bugs',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('View Project'),
        backgroundColor: const Color(0xFF00A884),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final data = projects[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama Project
                    Text(
                      data['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),

                    // Subjudul Fitur
                    const Text(
                      'Fitur yang dibutuhkan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Fitur Deskripsi
                    Text(
                      data['features']!,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00A884),
        unselectedItemColor: Colors.grey,
        currentIndex: 0, 
        onTap: (index) {
          // Logika untuk navigasi 
          if (index == 0) {
            Navigator.pop(context); 
          }
          
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Daftar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
