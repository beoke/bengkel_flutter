import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial Penggunaan Aplikasi'),
      ),
      body: const Center(
        child: Text(
          'Ini adalah halaman tutorial.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}