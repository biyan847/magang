import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/From_tambah.dart';

class ListPembimbingAdmin extends StatelessWidget {
  final List<String> pembimbing;

  const ListPembimbingAdmin({super.key, this.pembimbing = const []});

  @override
  Widget build(BuildContext context) {
    // Jika parameter pembimbing kosong, gunakan data default
    final List<Map<String, String>> dataPembimbing = pembimbing.isNotEmpty
        ? pembimbing
            .map((name) => {
                  'name': name,
                  'email': '${name.toLowerCase().replaceAll(' ', '')}@mail.com',
                  'phone': '081234567890',
                  'department': 'Teknik Informatika',
                })
            .toList()
        : [
            {
              'name': 'Siswanto',
              'email': 'siswanto@mail.com',
              'phone': '081234567890',
              'department': 'Teknik Informatika',
            },
            {
              'name': 'Muhammad Hanif',
              'email': 'hanif@mail.com',
              'phone': '081987654321',
              'department': 'Sistem Informasi',
            },
          ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Pembimbing'),
        backgroundColor: const Color(0xFF00A884),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dataPembimbing.length,
          itemBuilder: (context, index) {
            final data = dataPembimbing[index];
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
                    // Tombol Hapus
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Logika hapus dengan Snackbar
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Hapus Pembimbing'),
                            content: Text(
                                'Apakah Anda yakin ingin menghapus ${data['name']}?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Batal'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
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
                          builder: (context) => Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Detail Pembimbing',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 16),
                                  DetailRow(
                                      label: 'Nama', value: data['name']!),
                                  DetailRow(
                                      label: 'Email', value: data['email']!),
                                  DetailRow(
                                      label: 'Telepon', value: data['phone']!),
                                  DetailRow(
                                      label: 'Departemen',
                                      value: data['department']!),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color(0xFF00A884),
                                      minimumSize:
                                          const Size(double.infinity, 50),
                                    ),
                                    child: const Text('Tutup'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF00A884)),
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
      // Tombol Tambah Pembimbing
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TambahPembimbingPage()),
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

  const DetailRow({super.key, required this.label, required this.value});

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
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
