import 'package:flutter/material.dart';

class AddKendaraanScreen extends StatelessWidget {
  const AddKendaraanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kendraan'),
      ),
      body: const Center(
        child: Text(
          'Tambah Kendaraan',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
