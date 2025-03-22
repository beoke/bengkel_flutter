import 'dart:convert';
import 'dart:typed_data';

class Sparepart {
  final String kodeSparepart;
  final String namaSparepart;
  final int stok;
  final int stokMinimum;
  final int harga;
  final Uint8List imageData;

  Sparepart({
    required this.kodeSparepart,
    required this.namaSparepart,
    required this.stok,
    required this.stokMinimum,
    required this.harga,
    required this.imageData,
  });

  // Factory method untuk parsing dari JSON
  factory Sparepart.fromJson(Map<String, dynamic> json) {
    return Sparepart(
      kodeSparepart: json['kode_sparepart'],
      namaSparepart: json['nama_sparepart'],
      stok: json['stok'],
      stokMinimum: json['stok_minimum'],
      harga: json['harga'],
      imageData: base64Decode(json['image_data']), // Decode Base64 ke Uint8List
    );
  }

  // Method untuk mengubah objek ke JSON
  Map<String, dynamic> toJson() {
    return {
      'kode_sparepart': kodeSparepart,
      'nama_sparepart': namaSparepart,
      'stok': stok,
      'stok_minimum': stokMinimum,
      'harga': harga,
      'image_data': base64Encode(imageData), // Encode Uint8List ke Base64
    };
  }
}
