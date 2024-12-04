import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/Fromtambah_project.dart';
import 'package:flutter_application_1/admin/list_Pendaftar.dart';
import 'package:flutter_application_1/admin/list_pembimbing.dart';
import 'package:flutter_application_1/admin/profile.dart';


class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});
  
  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  int _currentIndex = 0;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), 
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00A884),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
              onTap: (index) {
            if (index == 0) {
              // Jika tab Home diklik
              setState(() {
                _currentIndex = index;
              });
            } else if (index == 1) {
              // Navigasi ke halaman List Bimbingan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListPendaftarPage(),
                ),
              );
            } else if (index == 2) {
              // Navigasi ke halaman Progress
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListPembimbingAdmin(),
                ),
              );
            } else if (index == 3) {
              // Navigasi ke halaman Profile
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileAdmin(),
                ),
              );
            }
          },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Pendaftar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Pembimbing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
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
                      'Admin',
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
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 500,
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
                          'Profil Anda',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00A884),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Nama Admin',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          'Ahmad',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Lokasi Admin',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          'Yogyakarta',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Jumlah Pembimbing',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          '2',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
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
                          // Navigasi ke halaman View Project
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListPembimbingAdmin(),
                            ),
                          );
                        },
                        
                        child: Container(
                          height: 100,
                          margin: const EdgeInsets.only(right: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6F7F1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.folder,
                                color: Color(0xFF00A884),
                                size: 30,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Daftar Pembimbing',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
              
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Form Nilai Akhir
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Aksi tombol Form Nilai Akhir
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FormTambahProjectPage(),
                            ),
                          );
                        },
                        child: Container(
                          height: 100,
                          margin: const EdgeInsets.only(left: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF4E6),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                color: Color(0xFFFFA726),
                                size: 30,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Tambah Project',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                             
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


