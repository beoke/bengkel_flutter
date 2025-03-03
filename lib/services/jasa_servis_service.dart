import 'dart:convert';
import 'package:bengkel_flutter/models/PaketServis.dart';
import 'package:http/http.dart' as http;
import '../models/PaketServis.dart';

class JasaServisService {
  final String baseUrl = "https://localhost:7297/api/JasaServis";

  Future<List<JasaServis>> fetchJasaServis() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => JasaServis.fromJson(json)).toList();
      } else {
        throw Exception("Gagal mengambil data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Terjadi kesalahan: $e");
    }
  }
}
