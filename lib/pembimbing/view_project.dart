import 'package:flutter/material.dart';

class ViewProject extends StatefulWidget {
  const ViewProject({super.key});

  @override
  _ViewProjectState createState() => _ViewProjectState();
}

class _ViewProjectState extends State<ViewProject> {
  String? selectedProject;
  bool showDetailsCard = false;

  final List<String> projects = ['Project 1', 'Project 2', 'Project 3', 'Project 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'View Project',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Dropdown for selecting project
                buildDropdown(),
              ],
            ),
          ),
          if (showDetailsCard) buildDetailsOverlay(),
        ],
      ),
    );
  }

  // Function to build a dropdown with "Nama Project" as the hint text
  Widget buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: selectedProject,
        isExpanded: true,
        hint: const Text("Pilih Nama Project"),
        underline: const SizedBox(),
        icon: const Icon(Icons.arrow_drop_down),
        onChanged: (String? newValue) {
          setState(() {
            selectedProject = newValue;
            showDetailsCard = true; // Show the details card
          });
        },
        items: projects.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  // Widget to build the details overlay
  Widget buildDetailsOverlay() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.black.withOpacity(0.5), // Background overlay
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(8),
            ),
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Nama Project: $selectedProject',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('Deskripsi Project:', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 8),
                const Text('Tanggal Mulai:', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 16),
                const Text('Tanggal Selesai:', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showDetailsCard = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Kembali'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ViewProject(),
  ));
}
