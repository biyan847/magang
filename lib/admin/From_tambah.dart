import 'package:flutter/material.dart';

class FormTambahPembimbingPage extends StatelessWidget {
  const FormTambahPembimbingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller untuk input form
    final TextEditingController namaController = TextEditingController();
    final TextEditingController nikController = TextEditingController();
    final TextEditingController ttlController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pembimbing'),
        backgroundColor: const Color(0xFF00A884),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama Pembimbing
              const Text(
                'Nama Pembimbing',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan nama pembimbing',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // NIK
              const Text(
                'NIK',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: nikController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan NIK',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Tempat, Tanggal Lahir
              const Text(
                'Tempat, Tanggal Lahir',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: ttlController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan tempat, tanggal lahir',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Email
              const Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),

              // Tombol Tambah
              ElevatedButton(
                onPressed: () {
                  // Logika untuk menambahkan pembimbing
                  String nama = namaController.text.trim();
                  String nik = nikController.text.trim();
                  String ttl = ttlController.text.trim();
                  String email = emailController.text.trim();

                  if (nama.isEmpty ||
                      nik.isEmpty ||
                      ttl.isEmpty ||
                      email.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Semua data harus diisi!'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Pembimbing $nama berhasil ditambahkan!'),
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
