import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaketserviceScreen extends StatefulWidget {
  const PaketserviceScreen({super.key});

  @override
  State<PaketserviceScreen> createState() => _PaketserviceScreenState();
}

class _PaketserviceScreenState extends State<PaketserviceScreen> {
  late Future<List<dynamic>> _futureJasaServis;

  @override
  void initState() {
    super.initState();
    _futureJasaServis = fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.65:5000/api/JasaServis'), 
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
        title: const Text('Paket Service'),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _futureJasaServis,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Tidak ada data"));
          } else {
            final jasaServisList = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: jasaServisList.length,
              itemBuilder: (context, index) {
                final item = jasaServisList[index];
                return _buildItemBox(
                  'assets/paket_service.png',
                  item['nama_jasaServis'] ?? 'Tidak Ada Nama',
                  item['harga'] ?? 0,
                  item['keterangan'] ?? 'Tidak Ada Keterangan',
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
    String imagePath,
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
            leading: Image.asset(
              imagePath,
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
