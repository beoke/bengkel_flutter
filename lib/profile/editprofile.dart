import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Pofile'),
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
