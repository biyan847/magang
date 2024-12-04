import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/Fromtambah_project.dart';


class TambahProjectPage extends StatelessWidget {
  const TambahProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data project (simulasi)
    final List<Map<String, String>> projects = [
      {
        'name': 'Aplikasi Pendaftaran PKL',
        'description': 'Fitur: Pendaftaran, laporan progress, form penilaian akhir',
      },
      {
        'name': 'Aplikasi Pelaporan Bugs',
        'description': 'Fitur: Pelaporan bugs, tracking progress, penugasan bugs',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Project'),
        backgroundColor: const Color(0xFF00A884),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final data = projects[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                title: Text(
                  data['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon Hapus
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Logika untuk menghapus project
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Hapus Project'),
                            content: Text(
                              'Apakah Anda yakin ingin menghapus ${data['name']}?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Tutup dialog
                                },
                                child: const Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Tutup dialog
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Project ${data['name']} berhasil dihapus'),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Hapus',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    // Tombol Detail
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Detail Project',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      DetailRow(
                                        label: 'Nama Project',
                                        value: data['name']!,
                                      ),
                                      DetailRow(
                                        label: 'Deskripsi',
                                        value: data['description']!,
                                      ),
                                      const SizedBox(height: 16),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF00A884),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          minimumSize: const Size(
                                              double.infinity, 50),
                                        ),
                                        child: const Text('Tutup'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      style: TextButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF00A884)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Detail',
                        style: TextStyle(color: Color(0xFF00A884)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      // Tombol Tambah Project
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormTambahProjectPage(),
            ),
          );
        },
        backgroundColor: const Color(0xFF00A884),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
