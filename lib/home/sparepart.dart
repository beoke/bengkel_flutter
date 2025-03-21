import 'package:flutter/material.dart';

class SparepartScreen extends StatelessWidget {
  const SparepartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sparepart'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField untuk pencarian
            TextField(
              decoration: InputDecoration(
                labelText: 'Cari Sparepart',
                hintText: 'Masukkan nama sparepart...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),

            // Daftar produk
            Expanded(
              child: ListView(
                children: [
                  _buildItemBox(
                      Icons.shopping_cart, 'Spion', 'Rp 100.000', context),
                  _buildItemBox(
                      Icons.phone_android, 'Jok', 'Rp 1.500.000', context),
                  _buildItemBox(
                      Icons.laptop, 'Kampas Rem', 'Rp 8.000.000', context),
                  _buildItemBox(
                      Icons.laptop, 'Kampas Rem', 'Rp 8.000.000', context),
                  _buildItemBox(
                      Icons.laptop, 'Kampas Rem', 'Rp 8.000.000', context),
                  _buildItemBox(
                      Icons.laptop, 'Kampas Rem', 'Rp 8.000.000', context),
                  _buildItemBox(
                      Icons.laptop, 'Kampas Rem', 'Rp 8.000.000', context),
                  _buildItemBox(
                      Icons.laptop, 'Kampas Rem', 'Rp 8.000.000', context),
                  _buildItemBox(
                      Icons.laptop, 'Kampas Rem', 'Rp 8.000.000', context),
                  _buildItemBox(
                      Icons.laptop, 'Kampas Rem', 'Rp 8.000.000', context),
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
      IconData icon, String title, String price, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40.0),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                _showDetailDialog(
                    title, price, context); // Gunakan context yang diteruskan
              },
              child: const Text('Detail'),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan pop-up detail produk
  void _showDetailDialog(String title, String price, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text('Harga: $price'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: SparepartScreen(),
    ),
  );
}
