import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For the input formatter

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to Sign In page
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView( // Wrap the content in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(label: 'Nama'),
                CustomTextField(label: 'NIK'),
                CustomTextField(label: 'No. Telp'),
                CustomTextField(label: 'Tempat/Tanggal Lahir'),
                CustomTextField(label: 'Alamat'),
                CustomTextField(label: 'Username'),
                CustomTextField(label: 'Email'),
                CustomTextField(label: 'Password', obscureText: true),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    // Handle form submission
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 20),
                // Optionally, you can add a link to go to the SignInPage
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to SignInPage
                  },
                  child: Text(
                    'Already have an account? Sign In',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String label;
  final bool obscureText;

  CustomTextField({required this.label, this.obscureText = false});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: _controller,
        obscureText: _obscureText,
        maxLength: 12, // Limiting the input to 12 characters
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[300],
          labelText: widget.label,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          counterText: '', // Hides the counter
          suffixIcon: widget.label == 'Password'
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9]*$')), // Allow only letters and numbers
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
