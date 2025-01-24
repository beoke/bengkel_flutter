import 'package:flutter/material.dart';

class EditKendaraanScreen extends StatelessWidget {
  const EditKendaraanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Kendaraan'),
      ),
      body: const Center(
        child: Text(
          'Halaman edit',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
