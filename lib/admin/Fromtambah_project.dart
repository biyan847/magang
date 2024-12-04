import 'package:flutter/material.dart';

class FormTambahProjectPage extends StatelessWidget {
  const FormTambahProjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller untuk input form
    final TextEditingController namaController = TextEditingController();
    final TextEditingController deskripsiController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Project'),
        backgroundColor: const Color(0xFF00A884),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama Project
              const Text(
                'Nama Project',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan nama project',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Deskripsi
              const Text(
                'Deskripsi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: deskripsiController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan deskripsi project',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),

              // Tombol Tambah
              ElevatedButton(
                onPressed: () {
                  // Logika untuk menambahkan project
                  String nama = namaController.text.trim();
                  String deskripsi = deskripsiController.text.trim();

                  if (nama.isEmpty || deskripsi.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Semua data harus diisi!'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Project "$nama" berhasil ditambahkan!'),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A884),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Tambah',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
