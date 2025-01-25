// booking/bookingjadwal.dart
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
      ),
      body: const Center(
        child: Text(
          'Halaman Booking',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
