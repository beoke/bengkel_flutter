class JasaServis {
  final int idJasaServis;
  final String namaJasaServis;
  final double harga;
  final String keterangan;

  JasaServis({
    required this.idJasaServis,
    required this.namaJasaServis,
    required this.harga,
    required this.keterangan,
  });

  factory JasaServis.fromJson(Map<String, dynamic> json) {
    return JasaServis(
      idJasaServis: json['id_jasaservis'],
      namaJasaServis: json['nama_jasaservis'],
      harga: (json['harga'] as num).toDouble(),
      keterangan: json['keterangan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_jasaservis': idJasaServis,
      'nama_jasaservis': namaJasaServis,
      'harga': harga,
      'keterangan': keterangan,
    };
  }
}
