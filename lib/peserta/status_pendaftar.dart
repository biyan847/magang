import 'package:flutter/material.dart';

class StatusPendaftaranPage extends StatefulWidget {
  const StatusPendaftaranPage({super.key});

  @override
  State<StatusPendaftaranPage> createState() => _StatusPendaftaranPageState();
}

class _StatusPendaftaranPageState extends State<StatusPendaftaranPage> {
  // Simulasi status pendaftaran
  String status = 'Diproses'; // Bisa 'Diproses' atau 'Diterima'
  final String tanggalPendaftaran = '06/09/2024';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar PKL'),
        backgroundColor: const Color(0xFF00A884),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Aplikasi Pendaftaran PKL',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Status Pendaftaran
                        Row(
                          children: [
                            Text(
                              'Status: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: status == 'Diproses'
                                    ? Colors.orange[100]
                                    : Colors.green[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                status,
                                style: TextStyle(
                                  color: status == 'Diproses'
                                      ? Colors.orange
                                      : Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Tanggal Pendaftaran
                        Text(
                          tanggalPendaftaran,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (status == 'Diproses')
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              status = 'Dibatalkan';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[100],
                            foregroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                          ),
                          child: const Text('Cancel'),
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
}
