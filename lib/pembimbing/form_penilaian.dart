import 'package:flutter/material.dart';

class FormPenilaian extends StatelessWidget {
  const FormPenilaian({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: const Text(
          'Form Penilaian',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          height: 400, // Adjust height as needed
          width: 300,  // Adjust width as needed
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Text(
              'DOC Form',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ),
        ),
      ),
    );
  }
}
