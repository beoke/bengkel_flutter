import 'package:flutter/material.dart';

class PaketserviceScreen extends StatefulWidget {
  const PaketserviceScreen({super.key});

  @override
  State<PaketserviceScreen> createState() => _PaketserviceScreenState();
}

class _PaketserviceScreenState extends State<PaketserviceScreen> {
  // Daftar item yang bisa dibuka dan ditutup
  final List<bool> _isExpandedList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket Service'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Daftar produk
            Expanded(
              child: ListView(
                children: [
                  _buildItemBox(
                    'assets/paket_service.png', 
                    'Service Ringan',
                    'Ganti Oli + cek mesin',
                    context,
                    0,
                    [
                      '1. Ganti Oli',
                      '2. Cek Kesehatan Mesin',
                      '3. Coba di Jalan',
                    ],
                  ),
                  _buildItemBox(
                    'assets/paket_service.png', 
                    'Service Sedang',
                    'Ganti Sparepart + perbaikan ringan',
                    context,
                    1,
                    [
                      '1. Ganti Sparepart',
                      '2. Perbaikan Sistem Kelistrikan',
                      '3. Cek Kesehatan Mesin',
                      '4. Coba di Jalan',
                    ],
                  ),
                  _buildItemBox(
                    'assets/paket_service.png', 
                    'Service Berat',
                    'Turun Mesin + overhaul',
                    context,
                    2,
                    [
                      '1. Turun Mesin',
                      '2. Overhaul Mesin',
                      '3. Ganti Sparepart Utama',
                      '4. Cek Kesehatan Mesin',
                      '5. Coba di Jalan',
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat box item produk
  Widget _buildItemBox(
    String imagePath, // Parameter untuk path gambar
    String title,
    String price,
    BuildContext context,
    int index,
    List<String> services, // Daftar layanan untuk setiap paket
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          // Bagian atas (gambar, judul, dan harga)
          ListTile(
            leading: Image.asset(
              imagePath, // Menggunakan gambar dari assets
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              price,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: Icon(
              _isExpandedList[index]
                  ? Icons.expand_less
                  : Icons.expand_more,
            ),
            onTap: () {
              setState(() {
                _isExpandedList[index] = !_isExpandedList[index];
              });
            },
          ),

          // Container yang membuka ke bawah dengan animasi
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300), // Durasi animasi
            firstChild: Container(), // Container kosong saat tertutup
            secondChild: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: services
                    .map((service) => _buildServiceItem(service))
                    .toList(),
              ),
            ),
            crossFadeState: _isExpandedList[index]
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat item layanan
  Widget _buildServiceItem(String serviceName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.arrow_right, size: 20.0),
          const SizedBox(width: 8.0),
          Text(
            serviceName,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: PaketserviceScreen(),
    ),
  );
}