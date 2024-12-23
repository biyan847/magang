import 'package:flutter/material.dart';
import 'package:flutter_application_1/peserta/status_pendaftar.dart';

class KonfirmasiPendaftaranPage extends StatelessWidget {
  const KonfirmasiPendaftaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar PKL'),
        backgroundColor: const Color(0xFF00A884),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const Icon(Icons.description, size: 100, color: Colors.black54),
          const SizedBox(height: 20),
          const Text(
            'Terimakasih telah mendaftar PKL\ndi Diskominfosan YK',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              'Pendaftaran anda akan diproses dalam beberapa hari kedepan. '
              'Respon akan dikirim ke email yang tertera pada pendaftaran Anda.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Status Pendaftaran
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StatusPendaftaranPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00A884),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'Cek Hasil Pendaftaran',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
