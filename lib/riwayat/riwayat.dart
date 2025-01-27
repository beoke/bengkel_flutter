import 'package:flutter/material.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat'), // Judul AppBar
        backgroundColor: Colors.white, // Warna AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding untuk seluruh body
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Riwayat Service
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Riwayat ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Warna hitam untuk "Riwayat"
                    ),
                  ),
                  TextSpan(
                    text: 'Service',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 243, 56, 43), // Warna merah untuk "Service"
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10), // Jarak antara label dan container

            // Card Motor untuk Riwayat Service
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.motorcycle,
                                size: 40,
                                color: Colors.blue,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Motor',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Nomor Polisi: B 1234 XYZ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Merek: Honda'),
                              Text('CC: 150 CC'),
                              Text('Jenis: Motor Sport'),
                              Text('Tahun: 2022'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Ikon edit di pojok kanan bawah
                    Positioned(
                      right: 10,
                      bottom: 2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditKendaraanScreen(), // Ganti dengan halaman edit kendaraan
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/edit.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Jarak antara dua bagian

            // Bagian Riwayat Booking
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Riwayat ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Warna hitam untuk "Riwayat"
                    ),
                  ),
                  TextSpan(
                    text: 'Booking',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 243, 56, 43), // Warna merah untuk "Booking"
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10), // Jarak antara label dan container

            // Card Motor untuk Riwayat Booking
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.motorcycle,
                                size: 40,
                                color: Colors.blue,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Motor',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Nomor Polisi: B 5678 ABC',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Merek: Yamaha'),
                              Text('CC: 125 CC'),
                              Text('Jenis: Motor Bebek'),
                              Text('Tahun: 2021'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Ikon edit di pojok kanan bawah
                    Positioned(
                      right: 10,
                      bottom: 2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditKendaraanScreen(), // Ganti dengan halaman edit kendaraan
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/edit.png',
                          width: 24,
                          height: 24,
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
    );
  }
}

// Halaman EditKendaraanScreen (contoh)
class EditKendaraanScreen extends StatelessWidget {
  const EditKendaraanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Kendaraan'),
      ),
      body: const Center(
        child: Text('Halaman Edit Kendaraan'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: RiwayatScreen(),
  ));
}