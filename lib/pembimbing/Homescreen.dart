import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_application_1/pembimbing/list_pembimbing.dart';
import 'package:flutter_application_1/pembimbing/cek_progress.dart';
import 'package:flutter_application_1/pembimbing/form_penilaian.dart';
import 'package:flutter_application_1/pembimbing/login.dart';
import 'package:flutter_application_1/pembimbing/view_project.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late String currentTime;
  late String currentDate;
  bool showProfileCard = false;
  Timer? _timer; // Simpan referensi ke Timer

  @override
  void initState() {
    super.initState();
    currentTime = _getCurrentTime();
    currentDate = _getCurrentDate();

    // Update waktu dan tanggal setiap detik
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) { // Pastikan widget masih aktif sebelum memanggil setState
        setState(() {
          currentTime = _getCurrentTime();
          currentDate = _getCurrentDate();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Hentikan timer saat widget dihapus
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showProfileCard = !showProfileCard;
                      });
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 12,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 10,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Operator12',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          currentTime,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          currentDate,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: [
                        buildMenuButton(context, 'List Bimbingan'),
                        buildMenuButton(context, 'View Project Tersedia'),
                        buildMenuButton(context, 'Cek Progress'),
                        buildMenuButton(context, 'Form Penilaian Akhir'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (showProfileCard)
              ModalBarrier(
                color: Colors.black.withOpacity(0.5),
                dismissible: false,
              ),
            if (showProfileCard)
              Positioned(
                top: 120,
                left: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Username: Operator12',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text('Email:', style: TextStyle(fontSize: 14)),
                      const SizedBox(height: 8),
                      const Text('Alamat:', style: TextStyle(fontSize: 14)),
                      const SizedBox(height: 8),
                      const Text('No. Telpon:', style: TextStyle(fontSize: 14)),
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              showProfileCard = false;
                            });
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SignInPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return '${now.hour}:${now.minute}:${now.second}';
  }

  String _getCurrentDate() {
    final now = DateTime.now();
    return '${now.day}-${now.month}-${now.year}';
  }

  Widget buildMenuButton(BuildContext context, String title) {
    return ElevatedButton(
      onPressed: () {
        if (title == 'List Bimbingan') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ListPembimbing()),
          );
        } else if (title == 'Cek Progress') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CekProgress()),
          );
        } else if (title == 'Form Penilaian Akhir') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormPenilaian()),
          );
        } else if (title == 'View Project Tersedia') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ViewProject()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title clicked')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey[400],
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homescreen(),
  ));
}
