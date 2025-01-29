import 'package:flutter/material.dart';

class KonsultasiScreen extends StatefulWidget {
  const KonsultasiScreen({super.key});

  @override
  State<KonsultasiScreen> createState() => _KonsultasiScreenState();
}

class _KonsultasiScreenState extends State<KonsultasiScreen> {
  final TextEditingController _controller = TextEditingController(); // Controller untuk TextField

  void _sendMessage() {
    String message = _controller.text.trim(); // Ambil teks dari TextField
    if (message.isNotEmpty) {
      print("Pesan terkirim: $message"); // Tampilkan pesan di konsol
      _controller.clear(); // Bersihkan TextField setelah mengirim
    } else {
      print("Pesan tidak boleh kosong!"); // Pesan validasi jika kosong
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konsultasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField dan tombol kirim di bagian atas
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Tuliskan konsultasi...', // Placeholder
                      border: OutlineInputBorder(), // Border untuk TextField
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Jarak antara TextField dan ikon
                IconButton(
                  icon: const Icon(Icons.send), // Ikon pesawat
                  onPressed: _sendMessage, // Aksi saat ikon diklik
                ),
              ],
            ),
            const SizedBox(height: 16.0), // Jarak antara TextField dan konten di bawahnya
            Expanded(
              child: Container(
                // Tempat untuk konten lain (opsional)
                child: const Center(
                  child: Text('Konten lainnya bisa ditempatkan di sini.'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Bersihkan controller saat widget dihapus
    super.dispose();
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: KonsultasiScreen(),
    ),
  );
}