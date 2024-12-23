import 'package:flutter/material.dart';

class UploadProgressPage extends StatefulWidget {
  const UploadProgressPage({super.key});

  @override
  State<UploadProgressPage> createState() => _UploadProgressPageState();
}

class _UploadProgressPageState extends State<UploadProgressPage> {
  // Controllers untuk input teks
  final TextEditingController namaPesertaController =
      TextEditingController(text: 'Ahmad Dahlan');
  final TextEditingController pertemuanController = TextEditingController();
  final TextEditingController tanggalBimbinganController = TextEditingController();
  final TextEditingController projectController = TextEditingController();
  final TextEditingController progressController = TextEditingController();
  final TextEditingController pembimbingController = TextEditingController();

 
  String uploadedFileName = "Belum ada file yang dipilih";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Progress'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Nama Peserta
            _buildInputField(
              label: 'Nama Peserta/Ketua Kelompok',
              controller: namaPesertaController,
              readOnly: true,
            ),
            _buildInputField(
              label: 'Pertemuan ke',
              controller: pertemuanController,
              hint: 'Masukkan nomor pertemuan',
            ),
            _buildInputField(
              label: 'Tanggal Bimbingan',
              controller: tanggalBimbinganController,
              hint: 'Masukkan tanggal bimbingan',
            ),
            _buildInputField(
              label: 'Project Yang Dikerjakan',
              controller: projectController,
              hint: 'Masukkan nama project',
            ),
            _buildInputField(
              label: 'Progress anda',
              controller: progressController,
              hint: 'Masukkan progress terbaru',
            ),
            _buildInputField(
              label: 'Nama Pembimbing',
              controller: pembimbingController,
              hint: 'Masukkan nama pembimbing',
            ),

            const SizedBox(height: 16),

            // Upload File Presentasi
            const Text(
              'Upload File Presentasi (bila ada)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _uploadFile();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Upload'),
            ),
            const SizedBox(height: 8),
            Text(
              uploadedFileName,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),

            const SizedBox(height: 24),

            // Tombol Upload
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _submitProgress();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A884),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Upload',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk input field
  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    String? hint,
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk simulasi upload file
  void _uploadFile() {
    setState(() {
      uploadedFileName = "presentasi_project.pdf"; // Simulasi nama file
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('File berhasil diupload!')),
    );
  }

  // Fungsi untuk simpan data progress
  void _submitProgress() {
    // Simulasi submit
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Progress berhasil diupload!')),
    );
  }
}
