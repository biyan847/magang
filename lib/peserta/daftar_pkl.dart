import 'package:flutter/material.dart';
import 'package:flutter_application_1/peserta/konfirmasi_pendaf.dart';

class DaftarPklPage extends StatefulWidget {
  const DaftarPklPage({super.key});

  @override
  State<DaftarPklPage> createState() => _DaftarPklPageState();
}

class _DaftarPklPageState extends State<DaftarPklPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController namaPesertaController = TextEditingController();
  final TextEditingController kampusController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? selectedProject;
  String? selectedPembimbing;

  final List<String> projects = [
    'Aplikasi Pendaftaran PKL',
    'Aplikasi Pelaporan Bugs',
    'Sistem Informasi Karyawan'
  ];
  final List<String> pembimbing = [
    'Siswanto',
    'Muhammad Hanif',
    'Santoso',
  ];

  final List<Map<String, TextEditingController>> anggotaControllers = List.generate(
    6,
    (index) => {
      'nama': TextEditingController(),
      'nim': TextEditingController(),
    },
  );

  // Buat GlobalKey terpisah untuk setiap form
  final GlobalKey<FormState> _individuFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _kelompokFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar PKL'),
        backgroundColor: const Color(0xFF00A884),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Individu'),
            Tab(text: 'Kelompok'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildIndividuForm(),
          buildKelompokForm(),
        ],
      ),
    );
  }

  Widget buildIndividuForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _individuFormKey, // Gunakan form key khusus untuk individu
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextInput('Nama Peserta - NIM', namaPesertaController),
            buildTextInput('Nama Kampus', kampusController),
            buildTextInput('Email', emailController, email: true),
            buildDropdown('Project yang akan diambil', projects, (value) {
              setState(() {
                selectedProject = value;
              });
            }, selectedProject),
            buildDropdown('Pembimbing', pembimbing, (value) {
              setState(() {
                selectedPembimbing = value;
              });
            }, selectedPembimbing),
            const SizedBox(height: 24),
            buildSubmitButton(_individuFormKey),
          ],
        ),
      ),
    );
  }

  Widget buildKelompokForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _kelompokFormKey, // Gunakan form key khusus untuk kelompok
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextInput('Nama Ketua Kelompok - NIM', namaPesertaController),
            buildTextInput('Nama Kampus', kampusController),
            buildTextInput('Email', emailController, email: true),
            ...List.generate(6, (index) {
              return Column(
                children: [
                  buildTextInput('Nama Anggota ${index + 1}', anggotaControllers[index]['nama']!),
                  buildTextInput('NIM Anggota ${index + 1}', anggotaControllers[index]['nim']!),
                ],
              );
            }),
            buildDropdown('Project yang akan diambil', projects, (value) {
              setState(() {
                selectedProject = value;
              });
            }, selectedProject),
            buildDropdown('Pembimbing', pembimbing, (value) {
              setState(() {
                selectedPembimbing = value;
              });
            }, selectedPembimbing),
            const SizedBox(height: 24),
            buildSubmitButton(_kelompokFormKey),
          ],
        ),
      ),
    );
  }

  Widget buildTextInput(String label, TextEditingController controller, {bool email = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label wajib diisi';
          }
          if (email && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'Masukkan email yang valid';
          }
          return null;
        },
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, Function(String?) onChanged, String? selectedValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null) {
            return '$label wajib dipilih';
          }
          return null;
        },
      ),
    );
  }

  Widget buildSubmitButton(GlobalKey<FormState> formKey) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if (selectedProject == null || selectedPembimbing == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pilih project dan pembimbing')),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const KonfirmasiPendaftaranPage()),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00A884),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('Daftar', style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
