import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/list_pembimbing.dart'; 

class TambahPembimbingPage extends StatefulWidget {
  const TambahPembimbingPage({super.key});

  @override
  State<TambahPembimbingPage> createState() => _TambahPembimbingPageState();
}

class _TambahPembimbingPageState extends State<TambahPembimbingPage> {
  // Daftar semua data pembimbing
  final Map<String, String> allPembimbing = {
    "3": "Muhammad Hanif",
    "1": "Siswanto",
    "2": "Santoso",
  };

  // Daftar pembimbing yang dipilih
  List<Map<String, String>> selectedPembimbing = [];

  // Controller untuk input pencarian
  final TextEditingController _searchController = TextEditingController();

  String? searchResultKey;

  // Fungsi untuk filter data
  void _filterPembimbing(String query) {
    setState(() {
      searchResultKey = allPembimbing.containsKey(query) ? query : null;
    });
  }

  // Menambahkan pembimbing ke dalam list
  void _addPembimbing() {
    if (searchResultKey != null) {
      setState(() {
        final name = allPembimbing[searchResultKey!]!;
        selectedPembimbing.add({
          'name': name,
          'email': '${name.toLowerCase().replaceAll(' ', '')}@mail.com',
          'phone': '081234567890',
          'department': 'Teknik Informatika',
        });
      });
      // Snackbar Konfirmasi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("$searchResultKey - ${allPembimbing[searchResultKey]} berhasil ditambahkan")),
      );
      _searchController.clear();
      searchResultKey = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pembimbing'),
        backgroundColor: const Color(0xFF00A884),
      ),
      body: Column(
        children: [
          // Input Pencarian
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterPembimbing,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Masukkan ID Pembimbing',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),

          // Menampilkan Hasil Pencarian
          if (searchResultKey != null)
            ListTile(
              title: Text(
                allPembimbing[searchResultKey!]!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: ElevatedButton(
                onPressed: _addPembimbing,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A884),
                ),
                child: const Text(
                  'Tambah',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

          const SizedBox(height: 16),

          // Tombol Lanjut ke List Pembimbing
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListPembimbingAdmin(
                        pembimbing: selectedPembimbing.map((e) => e['name']!).toList(),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A884),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Lihat List Pembimbing',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
