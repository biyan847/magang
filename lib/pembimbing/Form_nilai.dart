import 'package:flutter/material.dart';

class FormNilaiAkhirPage extends StatelessWidget {
  const FormNilaiAkhirPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController namaController = TextEditingController();
    final TextEditingController judulLaporanController = TextEditingController();
    final TextEditingController tempatKerjaController = TextEditingController();
    final TextEditingController periodeController = TextEditingController();
    final TextEditingController inovasiController = TextEditingController();
    final TextEditingController kerjaSamaController = TextEditingController();
    final TextEditingController kedisiplinanController = TextEditingController();
    final TextEditingController sikapController = TextEditingController();
    final TextEditingController rataRataController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Nilai Akhir Peserta'),
        backgroundColor: const Color(0xFF00A884),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama Peserta
              const Text(
                'Nama Peserta/Ketua Kelompok - NIM',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  hintText: 'Ahmad Dahlan - 2021001',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Judul Laporan
              const Text(
                'Judul Laporan KP',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: judulLaporanController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Tempat Kerja Praktek
              const Text(
                'Tempat Kerja Praktek',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: tempatKerjaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Periode
              const Text(
                'Periode',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: periodeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Kriteria Penilaian
              const Text(
                'Kriteria penilaian',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // Inovasi
              const Text('Inovasi'),
              const SizedBox(height: 8),
              TextField(
                controller: inovasiController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Kerja Sama
              const Text('Kerja Sama'),
              const SizedBox(height: 8),
              TextField(
                controller: kerjaSamaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Kedisiplinan
              const Text('Kedisiplinan'),
              const SizedBox(height: 8),
              TextField(
                controller: kedisiplinanController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Sikap
              const Text('Sikap'),
              const SizedBox(height: 8),
              TextField(
                controller: sikapController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Rata-rata Nilai
              const Text('Rata-rata Nilai'),
              const SizedBox(height: 8),
              TextField(
                controller: rataRataController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Tombol Upload
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi tombol Upload
                    // Anda bisa menambahkan logika penyimpanan atau pengiriman data di sini
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Data Tersimpan'),
                        content: const Text('Nilai akhir telah berhasil diunggah.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A884),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Upload'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
