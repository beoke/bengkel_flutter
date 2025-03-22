import 'dart:convert';
import 'package:bengkel_flutter/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SparepartScreen extends StatefulWidget {
  const SparepartScreen({super.key});

  @override
  State<SparepartScreen> createState() => _SparepartScreenState();
}

class _SparepartScreenState extends State<SparepartScreen> {
  late Future<List<dynamic>> _futureSparepart;

  @override
  void initState() {
    super.initState();
    _futureSparepart = fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('${Config.baseUrl}/Sparepart'),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Terjadi kesalahan: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Sparepart'),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _futureSparepart,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Tidak ada data"));
          } else {
            final sparepartList = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: sparepartList.length,
              itemBuilder: (context, index) {
                final item = sparepartList[index];
                return _buildItemBox(
                  item['image_data'], // Menggunakan gambar dari API
                  item['nama_sparepart'] ?? 'Tidak Ada Nama',
                  item['harga'] ?? 0,
                  "Stok: ${item['stok']} | Min: ${item['stok_minimum']}",
                  context,
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildItemBox(
    String? imageBase64,
    String title,
    int price,
    String description,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          ListTile(
            leading: imageBase64 != null
                ? Image.memory(
                    base64Decode(imageBase64),
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/sparepart_default.png', // Default jika tidak ada gambar
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
            title: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rp ${price.toString()}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
