import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
// Halaman SignInPage Anda

class ProfilepagePeserta extends StatefulWidget {
  const ProfilepagePeserta({super.key});

  @override
  _ProfilepagePesertaState createState() => _ProfilepagePesertaState();
}

class _ProfilepagePesertaState extends State<ProfilepagePeserta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A884),
        title: const Text("Profile"),
       // leading: IconButton(
         // icon: const Icon(Icons.arrow_back),
         // onPressed: () {
           // Navigator.pop(context);
          //},
        //),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Foto Profil
            Center(
              child: Stack(
                clipBehavior: Clip.none, // Untuk menempatkan icon edit di luar foto
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: const AssetImage('assets/profile_picture.png'),
                    backgroundColor: Colors.grey[200],
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () {
                        // Aksi untuk mengganti foto profil
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Nama Pengguna dan Identitas
            const Center(
              child: Column(
                children: [
                  Text(
                    'Yoan Biyan',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'email',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Nomor Hp',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Menu Pengaturan dan Logout
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.settings, color: Color(0xFF00A884)),
                    title: const Text("Pengaturan Akun"),
                    onTap: () {
                      // Aksi untuk pengaturan akun
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text("Logout"),
                    onTap: () {
                      // Aksi logout
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Konfirmasi Logout"),
                            content: const Text("Apakah Anda yakin ingin keluar?"),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("Batal"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text("Logout"),
                                onPressed: () {
                                  // Aksi logout, redirect ke halaman login
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SignInPage()),
                                    (Route<dynamic> route) => false, // Hapus semua rute sebelumnya
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
