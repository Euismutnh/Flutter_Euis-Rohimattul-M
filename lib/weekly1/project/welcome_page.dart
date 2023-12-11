import 'dart:async';
import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool _isSubmitting = false;
  double _gradientOffset = 0.0;

  @override
  void initState() {
    super.initState();
    // Mengatur animasi gradient pada latar belakang
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _gradientOffset += 0.01;
        if (_gradientOffset > 1.0) {
          _gradientOffset = 0.0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Latar belakang dengan animasi gradient
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 23, 103, 26),
                    Color.fromARGB(255, 50, 173, 74),
                  ],
                ),
                backgroundBlendMode: BlendMode.modulate,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logopddd.png',
                    width: 180,
                    height: 270,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Selamat datang di Sistem Informasi Pendaftaran Mahasiswa Baru',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Dapatkan informasi lengkap mengenai pendaftaran mahasiswa baru, prosedur pendaftaran, dan persyaratan yang diperlukan. Jika Anda belum memiliki akun, silakan daftar untuk memulai proses pendaftaran.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Ada pertanyaan? Hubungi kami',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                              labelText: 'Username',
                              hintText: 'Masukkan username Anda',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Username is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Masukkan email Anda',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _messageController,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Message',
                              hintText: 'Tuliskan pertanyaan atau pesan Anda',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Message is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          Opacity(
                            opacity: _isSubmitting ? 0.5 : 1.0,
                            child: ElevatedButton(
                              onPressed: _isSubmitting
                                  ? null
                                  : () {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        _submitForm();
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 23, 103, 26),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: _isSubmitting
                                  ? const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      'Submit',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    // Proses pengiriman data
    setState(() {
      _isSubmitting = true;
    });

    // Simulasi proses pengiriman data selama 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isSubmitting = false;
      });
      _showSuccessDialog(
        context,
        _usernameController.text,
        _emailController.text,
        _messageController.text,
      );
    });
  }

  void _showSuccessDialog(
    BuildContext context,
    String username,
    String email,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pertanyaan Dikirim'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Username: $username'),
              Text('Email: $email'),
              Text('Message: $message'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 23, 103, 26),
              ),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
