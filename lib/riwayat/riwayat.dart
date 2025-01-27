import 'package:flutter/material.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  // Fungsi untuk menampilkan popup detail service
  void _showServiceDetailPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detail Service'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nomor Polisi: B 1234 XYZ'),
              Text('Merek: Honda'),
              Text('CC: 150 CC'),
              Text('Jenis: Motor Sport'),
              Text('Tahun: 2022'),
              Text('Tanggal Service: 20/10/2025'),
              Text('kategori Service: service ringan'),
              Text('Keluhan : gas seret'),
              Text(''),
              Text('Bengkel: DB TECNO'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menampilkan popup booking service
  void _showBookingDetailPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detail Booking'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nomor Polisi: B 1234 XYZ'),
              Text('Merek: Honda'),
              Text('CC: 150 CC'),
              Text('Jenis: Motor Matic'),
              Text('Tahun: 2022'),
              Text('Tanggal booking: 20/10/2025'),
              Text('kategori Service: service berat'),
              Text('keluhan : Mesin kasar'),
              Text(''),
              Text('Bengkel: DB TECNO'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

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
                      color: Color.fromARGB(
                          255, 243, 56, 43), // Warna merah untuk "Service"
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
                          padding: const EdgeInsets.only(left: 30, bottom: 50),
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
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom:
                                    40.0), // Padding bawah untuk memberi ruang pada teks "Service" dan "Cek Detail"
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Nomor Polisi: B 1234 XYZ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text('Merek: Honda'),
                                SizedBox(height: 4),
                                Text('CC: 150 CC'),
                                SizedBox(height: 4),
                                Text('Jenis: Motor Sport'),
                                SizedBox(height: 4),
                                Text('Tahun: 2022'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Label "Service 20/10/2025" di pojok kiri bawah
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text(
                        'Service 20/10/2025',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    // Tombol "Cek Detail" di pojok kanan bawah
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: GestureDetector(
                        onTap: () {
                          _showServiceDetailPopup(
                              context); // Tampilkan popup detail
                        },
                        child: const Text(
                          'Cek Detail',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
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
                      color: Color.fromARGB(
                          255, 243, 56, 43), // Warna merah untuk "Booking"
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
                          padding: const EdgeInsets.only(left: 30, bottom: 50),
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
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom:
                                    40.0), // Padding bawah untuk memberi ruang pada teks "Booking" dan "Cek Detail"
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Nomor Polisi: B 5678 ABC',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text('Merek: Yamaha'),
                                SizedBox(height: 4),
                                Text('CC: 125 CC'),
                                SizedBox(height: 4),
                                Text('Jenis: Motor Bebek'),
                                SizedBox(height: 4),
                                Text('Tahun: 2021'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Label "Booking 20/10/2025" di pojok kiri bawah
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text(
                        'Booking 20/10/2025',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    // Tombol "Cek Detail" di pojok kanan bawah
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: GestureDetector(
                        onTap: () {
                          _showBookingDetailPopup(
                              context); // Tampilkan popup detail
                        },
                        child: const Text(
                          'Cek Detail',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
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
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: RiwayatScreen(),
  ));
}
