class RiwayatBooking {
  final String nopol;
  final String merk;
  final String cc;
  final String jenisMotor;
  final String tahunMotor;
  final String status; // Dikerjakan, Menunggu, atau Dibatalkan
  final String tanggalBooking;

  RiwayatBooking({
    required this.nopol,
    required this.merk,
    required this.cc,
    required this.jenisMotor,
    required this.tahunMotor,
    required this.status,
    required this.tanggalBooking,
  });

  factory RiwayatBooking.fromJson(Map<String, dynamic> json) {
    return RiwayatBooking(
      nopol: json['nopol'],
      merk: json['merk'],
      cc: json['cc'],
      jenisMotor: json['jenis_motor'],
      tahunMotor: json['tahun_motor'],
      status: json['status'],
      tanggalBooking: json['tanggal_booking'],
    );
  }
}

class RiwayatServis {
  final String nopol;
  final String merk;
  final String cc;
  final String jenisMotor;
  final String tahunMotor;
  final String status; // Selesai
  final String tanggalSelesai;

  RiwayatServis({
    required this.nopol,
    required this.merk,
    required this.cc,
    required this.jenisMotor,
    required this.tahunMotor,
    required this.status,
    required this.tanggalSelesai,
  });

  factory RiwayatServis.fromJson(Map<String, dynamic> json) {
    return RiwayatServis(
      nopol: json['nopol'],
      merk: json['merk'],
      cc: json['cc'],
      jenisMotor: json['jenis_motor'],
      tahunMotor: json['tahun_motor'],
      status: json['status'],
      tanggalSelesai: json['tanggal_selesai'],
    );
  }
}
