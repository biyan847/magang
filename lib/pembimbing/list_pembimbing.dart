import 'package:flutter/material.dart';

class ListPembimbing extends StatefulWidget {
  const ListPembimbing({super.key});

  @override
  _ListPembimbingState createState() => _ListPembimbingState();
}

class _ListPembimbingState extends State<ListPembimbing> {
  String? selectedUser;
  bool showDetailsCard = false;

  final List<String> users = ['User 1', 'User 2', 'User 3', 'User 4'];

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
          'List Bimbingan',
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
                // Dropdown for selecting user
                buildDropdown(),
              ],
            ),
          ),
          if (showDetailsCard) buildDetailsOverlay(),
        ],
      ),
    );
  }

  // Function to build a dropdown with "Nama User" as the hint text
  Widget buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: selectedUser,
        isExpanded: true,
        hint: const Text("Pilih Nama User"),
        underline: const SizedBox(),
        icon: const Icon(Icons.arrow_drop_down),
        onChanged: (String? newValue) {
          setState(() {
            selectedUser = newValue;
            showDetailsCard = true; // Show the details card
          });
        },
        items: users.map<DropdownMenuItem<String>>((String value) {
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
                  'Nama User: $selectedUser',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('Project:', style: TextStyle(fontSize: 14)),
                const SizedBox(height: 8),
                const Text('Tanggal Bimbingan', style: TextStyle(fontSize: 14)),
                DropdownButton<String>(
                  value: null,
                  hint: const Text('Belum di set'),
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue) {
                    // Handle date selection here
                  },
                  items: <String>['Tanggal 1', 'Tanggal 2', 'Tanggal 3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
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
    home: ListPembimbing(),
  ));
}
