import 'package:flutter/material.dart';
import 'package:flutter_application_1/peserta/daftar_pkl.dart';
import 'package:flutter_application_1/peserta/laman_progress.dart';
import 'package:flutter_application_1/peserta/profile.dart';
import 'package:flutter_application_1/peserta/view_nilai.dart';
import 'package:flutter_application_1/peserta/viewproject.dart';

class HomepagePeserta extends StatefulWidget {
  const HomepagePeserta({super.key});

  @override
  State<HomepagePeserta> createState() => _HomepagePesertaState();
}

class _HomepagePesertaState extends State<HomepagePeserta> {
  int _currentIndex = 0;

  // List halaman yang akan ditampilkan
  final List<Widget> _pages = [
    const HomePageContent(),
    const DaftarPklPage(),
    const ProgressPage(),
    const ProfilepagePeserta(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00A884),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
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

// Widget konten halaman Home
class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              color: const Color(0xFF00A884),
              padding: const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Peserta PKL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Jadwal Terdekat
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jadwal Anda',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00A884),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Project Anda',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      'Aplikasi Pendaftaran PKL',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Progress',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      'Pembuatan design untuk aplikasi',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Tanggal Pertemuan',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      '21 November 2024, 08:00 WIB',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            // Tombol View Project dan Form Nilai Akhir
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  // View Project
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ViewProjectPage2()),
                        );
                      },
                      child: buildCard('View Project', Icons.folder, Colors.green, ''),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // View Nilai Akhir
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ViewNilaiAkhirPage()),
                        );
                      },
                      child: buildCard('View Nilai Akhir', Icons.edit, Colors.orange, ''),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String title, IconData icon, Color color, String subtitle) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
