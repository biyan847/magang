import 'package:flutter/material.dart';

class ListPendaftarPage extends StatelessWidget {
  const ListPendaftarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data pendaftar (simulasi)
    final List<Map<String, String>> pendaftar = [
      {
        'name': 'Ahmad Dahlan',
        'nim': '2021001',
        'project': 'Aplikasi Pendaftaran PKL',
        'kampus': 'Universitas Muhammadiyah Yogyakarta',
        'email': 'user12@mail.com',
        'pembimbing': 'Siswanto',
        'status': 'Diterima'
      },
      {
        'name': 'Bayu Surono',
        'nim': '2021002',
        'project': 'Aplikasi Pelaporan Bugs',
        'kampus': 'Universitas Gadjah Mada',
        'email': 'user13@mail.com',
        'pembimbing': 'Widodo',
        'status': 'Diterima'
      },
      {
        'name': 'Dimas Anggara',
        'nim': '2021003',
        'project': 'Sistem Informasi Karyawan',
        'kampus': 'Universitas Negeri Yogyakarta',
        'email': 'user14@mail.com',
        'pembimbing': 'Santoso',
        'status': 'Ditolak'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Pendaftar'),
        backgroundColor: const Color(0xFF00A884),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: pendaftar.length,
          itemBuilder: (context, index) {
            final data = pendaftar[index];
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
                        // Logika untuk menghapus pendaftar
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Hapus Pendaftar'),
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
                                          '${data['name']} berhasil dihapus'),
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
                                        'Detail Peserta',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      DetailRow(
                                        label: 'Nama Peserta - NIM',
                                        value:
                                            '${data['name']} - ${data['nim']}',
                                      ),
                                      DetailRow(
                                        label: 'Project',
                                        value: data['project']!,
                                      ),
                                      DetailRow(
                                        label: 'Nama Kampus',
                                        value: data['kampus']!,
                                      ),
                                      DetailRow(
                                        label: 'Email',
                                        value: data['email']!,
                                      ),
                                      DetailRow(
                                        label: 'Pembimbing',
                                        value: data['pembimbing']!,
                                      ),
                                      DetailRow(
                                        label: 'Status',
                                        value: data['status']!,
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
