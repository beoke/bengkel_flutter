import 'package:flutter/material.dart';

class AddKendaraanScreen extends StatelessWidget {
  const AddKendaraanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller untuk setiap TextField
    final noPolController = TextEditingController();
    final merkController = TextEditingController();
    final tipeController = TextEditingController();
    final transmisiController = TextEditingController();
    final ccController = TextEditingController();
    final tahunController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kendaraan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: noPolController,
              decoration: const InputDecoration(
                labelText: 'No Polisi',
                hintText: 'Masukkan Nomor Polisi',
                border: OutlineInputBorder(), // Menambahkan border
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: merkController,
              decoration: const InputDecoration(
                labelText: 'Merk',
                hintText: 'Masukkan Merk Kendaraan',
                border: OutlineInputBorder(), // Menambahkan border
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: tipeController,
              decoration: const InputDecoration(
                labelText: 'Tipe',
                hintText: 'Masukkan Tipe Kendaraan',
                border: OutlineInputBorder(), // Menambahkan border
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: transmisiController,
              decoration: const InputDecoration(
                labelText: 'Transmisi',
                hintText: 'Masukkan Jenis Transmisi',
                border: OutlineInputBorder(), // Menambahkan border
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ccController,
              decoration: const InputDecoration(
                labelText: 'CC',
                hintText: 'Masukkan Kapasitas Mesin (CC)',
                border: OutlineInputBorder(), // Menambahkan border
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: tahunController,
              decoration: const InputDecoration(
                labelText: 'Tahun',
                hintText: 'Masukkan Tahun Kendaraan',
                border: OutlineInputBorder(), // Menambahkan border
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol ditekan
                final noPol = noPolController.text;
                final merk = merkController.text;
                final tipe = tipeController.text;
                final transmisi = transmisiController.text;
                final cc = ccController.text;
                final tahun = tahunController.text;

                // Lakukan sesuatu dengan data yang diinput (misalnya, simpan ke database)
                print('No Polisi: $noPol');
                print('Merk: $merk');
                print('Tipe: $tipe');
                print('Transmisi: $transmisi');
                print('CC: $cc');
                print('Tahun: $tahun');

                // Tampilkan pesan sukses
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Kendaraan berhasil ditambahkan!'),
                  ),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}