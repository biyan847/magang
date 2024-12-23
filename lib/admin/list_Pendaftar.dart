import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/From_tambah.dart';

class TambahProjectPage extends StatefulWidget {
  const TambahProjectPage({super.key});

  @override
  State<TambahProjectPage> createState() => _TambahProjectPageState();
}

class _TambahProjectPageState extends State<TambahProjectPage> {
  // Data Dummy Project
  final List<Map<String, String>> projects = [
    {
      "title": "Aplikasi Pendaftaran PKL",
      "fitur": "Manajemen User, Pendaftaran, View Project, Upload Laporan Progress, Form Penilaian Akhir",
    },
    {
      "title": "Aplikasi Pelaporan Bugs",
      "fitur": "Manajemen Bug, Pelaporan Realtime, Statistik Laporan, Notifikasi",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Project'),
        backgroundColor: const Color(0xFF00A884),
        //leading: IconButton(
          //icon: const Icon(Icons.arrow_back),
          //onPressed: () => Navigator.pop(context),
        //),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 2,
              child: ListTile(
                title: Text(
                  project['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Tombol Detail
                    ElevatedButton(
                      onPressed: () {
                        _showDetailDialog(context, project);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE6F7F1),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      ),
                      child: const Text(
                        "Detail",
                        style: TextStyle(color: Color(0xFF00A884), fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Tombol Hapus
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _confirmDeleteProject(context, project['title']!);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      // Floating Action Button
   floatingActionButton: FloatingActionButton(
  heroTag: 'list_pembimbing_fab', // Tambahkan heroTag yang unik
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TambahPembimbingPage(),
      ),
    );
  },
  backgroundColor: const Color(0xFF00A884),
  child: const Icon(Icons.add),
),

    );
  }

  // Fungsi menampilkan Detail Project
  void _showDetailDialog(BuildContext context, Map<String, String> project) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text(
            "Detail Project",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailItem("Nama Project", project['title']!),
              const SizedBox(height: 8),
              _buildDetailItem("Fitur yang dibutuhkan", project['fitur']!),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Tutup"),
            ),
          ],
        );
      },
    );
  }

  // Fungsi menampilkan konfirmasi hapus
  void _confirmDeleteProject(BuildContext context, String projectTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: const Text(
            "Data Project berhasil dihapus",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  projects.removeWhere((project) => project['title'] == projectTitle);
                });
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menampilkan detail item
  Widget _buildDetailItem(String label, String value) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Colors.black),
        children: [
          TextSpan(
            text: '$label\n',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
