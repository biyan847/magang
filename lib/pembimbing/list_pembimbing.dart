import 'package:flutter/material.dart';
import 'dart:ui'; // Untuk efek blur
import 'set_bimbingan.dart'; // Halaman pengaturan tanggal & waktu

class ListBimbinganPage extends StatefulWidget {
  const ListBimbinganPage({super.key});

  @override
  State<ListBimbinganPage> createState() => _ListBimbinganPageState();
}

class _ListBimbinganPageState extends State<ListBimbinganPage> {
  bool showDetail = false; // Untuk menampilkan halaman detail
  Map<String, dynamic>? selectedDetail; // Data peserta yang dipilih

  final List<Map<String, dynamic>> bimbinganList = [
    {
      "name": "Ahmad Dahlan",
      "project": "Aplikasi Pendaftaran PKL",
      "meetingDate": DateTime(2024, 11, 21, 8, 0),
      "duration": "2 Bulan",
      "interval": "2 Minggu",
    },
    {
      "name": "Justin Hubner",
      "project": "Aplikasi Pelaporan Bugs",
      "meetingDate": DateTime(2024, 12, 1, 10, 0),
      "duration": "3 Bulan",
      "interval": "1 Minggu",
    },
    {
      "name": "Martin Paes",
      "project": "Aplikasi Pelaporan Bugs",
      "meetingDate": DateTime(2024, 12, 5, 14, 0),
      "duration": "1 Bulan",
      "interval": "2 Minggu",
    },
  ];

  String formatDateTime(DateTime dateTime) {
    String day = dateTime.day.toString().padLeft(2, '0');
    String month = dateTime.month.toString().padLeft(2, '0');
    String year = dateTime.year.toString();
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    return "$day-$month-$year, $hour:$minute";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text("List Bimbingan"),
        backgroundColor: const Color(0xFF00A884),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // List Bimbingan sebagai background
          ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: bimbinganList.length,
            itemBuilder: (context, index) {
              final bimbingan = bimbinganList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bimbingan['name']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Project Yang Dipilih",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            bimbingan['project']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showDetail = true; // Tampilkan halaman detail
                            selectedDetail = bimbingan; // Simpan data peserta
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFE6F7F1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Detail",
                          style: TextStyle(
                            color: Color(0xFF00A884),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // Overlay untuk halaman detail
          if (showDetail)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Efek blur
              child: Container(
                color: Colors.black.withOpacity(0.3), // Latar belakang gelap
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Detail Peserta",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00A884),
                        ),
                      ),
                      const SizedBox(height: 16),
                      detailItem("Nama Peserta", selectedDetail?['name'] ?? ""),
                      detailItem("Project", selectedDetail?['project'] ?? ""),
                      detailItem(
                          "Nama Kampus", "Universitas Muhammadiyah Yogyakarta"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: detailItem(
                              "Tanggal Pertemuan",
                              formatDateTime(selectedDetail?['meetingDate']),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SetBimbinganPage(
                                    name: selectedDetail?['name'] ?? "",
                                    initialDate:
                                        selectedDetail?['meetingDate'] ?? DateTime.now(),
                                    initialTime: TimeOfDay(
                                      hour: selectedDetail?['meetingDate']?.hour ?? 8,
                                      minute:
                                          selectedDetail?['meetingDate']?.minute ?? 0,
                                    ),
                                    initialDuration:
                                        selectedDetail?['duration'] ?? "2 Bulan",
                                    initialInterval:
                                        selectedDetail?['interval'] ?? "2 Minggu",
                                  ),
                                ),
                              );

                              if (result != null) {
                                setState(() {
                                  selectedDetail?['meetingDate'] = DateTime(
                                    result['date'].year,
                                    result['date'].month,
                                    result['date'].day,
                                    result['time'].hour,
                                    result['time'].minute,
                                  );
                                  selectedDetail?['duration'] = result['duration'];
                                  selectedDetail?['interval'] = result['interval'];
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00A884),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text("Set"),
                          ),
                        ],
                      ),
                      detailItem("Durasi", selectedDetail?['duration'] ?? ""),
                      detailItem("Interval", selectedDetail?['interval'] ?? ""),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                showDetail = false; // Tutup halaman detail
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Close",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget detailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
