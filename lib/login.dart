import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/homeadmin.dart';
import 'package:flutter_application_1/pembimbing/Homescreen.dart';
import 'package:flutter_application_1/peserta/homescreen.dart';
import 'package:flutter_application_1/register.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false; // Untuk indikator loading

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Validasi input kosong
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Input Tidak Valid'),
          content: const Text('Harap masukkan email dan password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    // Simulasi proses login
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    if (email == 'admin@mail.com' && password == '123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeAdmin(),
        ),
      );
    } else if (email == 'operator12@mail.com' && password == '123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else if (email == 'DummyPeserta@mail.com' && password == '123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomepagePeserta(),
        ),
      );
    } else {
      // Tampilkan pesan error login
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Gagal'),
          content: const Text('Email atau password yang Anda masukkan salah.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00A884),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            // Logo dan nama organisasi
            Image.asset(
              'assets/logo.png',
              height: 140,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              'Dinas Komunikasi Informatika\n dan Persandian',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            // Formulir login
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00A884),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Silahkan masukkan email dan password Anda untuk melanjutkan masuk ke aplikasi',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon:
                          const Icon(Icons.email, color: Color(0xFF00A884)),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon:
                          const Icon(Icons.lock, color: Color(0xFF00A884)),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isLoading ? null : login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00A884),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        : const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: 'Belum memiliki akun? ',
                          style: TextStyle(color: Colors.grey),
                          children: [
                            TextSpan(
                              text: 'Daftar',
                              style: TextStyle(
                                color: Color(0xFF00A884),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
