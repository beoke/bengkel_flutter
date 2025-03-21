import 'dart:convert';
import 'package:bengkel_flutter/models/PaketServis.dart';
import 'package:http/http.dart' as http;
import 'package:bengkel_flutter/config.dart';

class JasaServisService {
  Future<List<Map<String, dynamic>>?> getJasaServis() async {
    try {
      final response =
          await http.get(Uri.parse('${Config.baseUrl}/JasaSservis'));

      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(jsonDecode(response.body));
      } else {
        throw Exception("Gagal mengambil data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Terjadi kesalahan: $e");
    }
  }
}
