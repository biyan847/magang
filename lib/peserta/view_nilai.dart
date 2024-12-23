import 'package:flutter/material.dart';

class ViewNilaiAkhirPage extends StatelessWidget {
  const ViewNilaiAkhirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Nilai Akhir'),
        backgroundColor: const Color(0xFF00A884),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.grey[300], 
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              'PDF',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF00A884),
        unselectedItemColor: Colors.grey,
        currentIndex: 0, 
        onTap: (index) {
         
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Daftar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
