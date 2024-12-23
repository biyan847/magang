import 'dart:ui'; // Diperlukan untuk efek blur
import 'package:flutter/material.dart';

class CekProgressPage extends StatelessWidget {
  const CekProgressPage({super.key});

  // Data Dummy untuk Progress
  final List<Map<String, String>> progressList = const [
    {
      "title": "Aplikasi Pendaftaran PKL",
      "progress": "Menentukan Rencana Project",
      "date": "21 November 2024",
      "pembimbing": "Siswanto",
      "pertemuan": "1",
      "project": "Aplikasi Pendaftaran PKL",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cek Progress'),
        backgroundColor: const Color(0xFF00A884),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: progressList.length,
          itemBuilder: (context, index) {
            final progress = progressList[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Konten Kiri
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          progress["title"]!,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text("Progress Anda", style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 4),
                        Text(progress["progress"]!, style: const TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                  // Konten Kanan
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Menampilkan dialog detail dengan background blur
                          _showDetailDialog(context, progress);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00A884),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        ),
                        child: const Text('Detail', style: TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                      const SizedBox(height: 8),
                      Text(progress["date"]!, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan dialog dengan efek blur
  void _showDetailDialog(BuildContext context, Map<String, String> progressData) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Efek blur
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Progress Anda',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildDetailItem('Nama Peserta/Ketua Kelompok', 'Ahmad Dahlan'),
                  _buildDetailItem('Pertemuan ke', progressData['pertemuan']!),
                  _buildDetailItem('Tanggal Bimbingan', progressData['date']!),
                  _buildDetailItem('Project yang Dikerjakan', progressData['project']!),
                  _buildDetailItem('Progress Anda', progressData['progress']!),
                  _buildDetailItem('Nama Pembimbing', progressData['pembimbing']!),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget untuk menampilkan detail item
  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14, color: Colors.black),
          children: [
            TextSpan(
              text: '$label\n',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF00A884),
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
