import 'package:flutter/material.dart';

class SetBimbinganPage extends StatefulWidget {
  final String name;
  final DateTime initialDate;
  final TimeOfDay initialTime;
  final String initialDuration;
  final String initialInterval;

  const SetBimbinganPage({
    super.key,
    required this.name,
    required this.initialDate,
    required this.initialTime,
    required this.initialDuration,
    required this.initialInterval,
  });

  @override
  State<SetBimbinganPage> createState() => _SetBimbinganPageState();
}

class _SetBimbinganPageState extends State<SetBimbinganPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  late TextEditingController durationController;
  late TextEditingController intervalController;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    selectedTime = widget.initialTime;
    durationController = TextEditingController(text: widget.initialDuration);
    intervalController = TextEditingController(text: widget.initialInterval);
  }

  @override
  void dispose() {
    durationController.dispose();
    intervalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text("Set Jadwal Bimbingan - ${widget.name}"),
        backgroundColor: const Color(0xFF00A884),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Pilih Tanggal
            buildPicker(
              label: "Pilih Tanggal",
              value: selectedDate == null
                  ? "Klik untuk memilih tanggal"
                  : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
            ),
            const SizedBox(height: 16),

            // Pilih Waktu
            buildPicker(
              label: "Pilih Waktu",
              value: selectedTime == null
                  ? "Klik untuk memilih waktu"
                  : selectedTime!.format(context),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: selectedTime ?? TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  setState(() {
                    selectedTime = pickedTime;
                  });
                }
              },
            ),
            const SizedBox(height: 16),

            // Input Durasi dan Interval
            buildTextField("Durasi", durationController),
            const SizedBox(height: 16),
            buildTextField("Interval", intervalController),
            const SizedBox(height: 16),

            // Tombol Simpan
            ElevatedButton(
              onPressed: () {
                if (selectedDate != null && selectedTime != null) {
                  // Kirim data kembali ke halaman sebelumnya
                  Navigator.pop(context, {
                    "date": selectedDate,
                    "time": selectedTime,
                    "duration": durationController.text,
                    "interval": intervalController.text,
                  });
                } else {
                  // Tampilkan pesan jika tanggal atau waktu belum dipilih
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Pilih tanggal dan waktu terlebih dahulu."),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00A884),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Simpan",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPicker({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                value,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
    );
  }
}
