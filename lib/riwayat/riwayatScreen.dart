import 'package:flutter/material.dart';

class RiwayatBooking {
  final String nopol;
  final String merk;
  final String cc;
  final String jenisMotor;
  final String tahunMotor;
  final String status;
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
}

class RiwayatServis {
  final String nopol;
  final String merk;
  final String cc;
  final String jenisMotor;
  final String tahunMotor;
  final String status;
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
}

class  extends StatelessWidget {
  final List<RiwayatBooking> bookingList = [
    RiwayatBooking(
      nopol: "B 1234 XYZ",
      merk: "Honda",
      cc: "150",
      jenisMotor: "Sport",
      tahunMotor: "2022",
      status: "Dikerjakan",
      tanggalBooking: "2024-03-17",
    ),
    RiwayatBooking(
      nopol: "D 5678 ABC",
      merk: "Yamaha",
      cc: "155",
      jenisMotor: "Matic",
      tahunMotor: "2021",
      status: "Menunggu",
      tanggalBooking: "2024-03-15",
    ),
  ];

  final List<RiwayatServis> servisList = [
    RiwayatServis(
      nopol: "F 9876 PQR",
      merk: "Suzuki",
      cc: "125",
      jenisMotor: "Bebek",
      tahunMotor: "2020",
      status: "Selesai",
      tanggalSelesai: "2024-03-10",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riwayat Booking & Servis")),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Riwayat Booking", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ...bookingList.map((booking) => _buildRiwayatItem(context, booking)).toList(),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Riwayat Servis", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ...servisList.map((servis) => _buildRiwayatItem(context, servis)).toList(),
        ],
      ),
    );
  }

  Widget _buildRiwayatItem<T>(BuildContext context, T riwayat) {
    final bool isBooking = riwayat is RiwayatBooking;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.motorcycle, size: 40, color: Colors.blue),
        title: Text("${_getValue(riwayat, 'nopol')} - ${_getValue(riwayat, 'merk')}", style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("CC: ${_getValue(riwayat, 'cc')}, Jenis: ${_getValue(riwayat, 'jenisMotor')}, Tahun: ${_getValue(riwayat, 'tahunMotor')}"),
            const SizedBox(height: 4),
            Text(
              "Status: ${_getValue(riwayat, 'status')}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _getStatusColor(_getValue(riwayat, 'status')),
              ),
            ),
            Text("Tanggal: ${isBooking ? _getValue(riwayat, 'tanggalBooking') : _getValue(riwayat, 'tanggalSelesai')}"),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () => _showDetailPopup(context, riwayat, isBooking),
          child: const Text("Cek Detail"),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Dikerjakan":
        return Colors.orange;
      case "Menunggu":
        return Colors.grey;
      case "Dibatalkan":
        return Colors.red;
      case "Selesai":
        return Colors.green;
      default:
        return Colors.black;
    }
  }

  void _showDetailPopup<T>(BuildContext context, T riwayat, bool isBooking) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Detail ${isBooking ? "Booking" : "Servis"}"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nopol: ${_getValue(riwayat, 'nopol')}", style: const TextStyle(fontWeight: FontWeight.bold)),
              Text("Merk: ${_getValue(riwayat, 'merk')}"),
              Text("CC: ${_getValue(riwayat, 'cc')}"),
              Text("Jenis Motor: ${_getValue(riwayat, 'jenisMotor')}"),
              Text("Tahun: ${_getValue(riwayat, 'tahunMotor')}"),
              const Divider(),
              Text(
                "Status: ${_getValue(riwayat, 'status')}",
                style: TextStyle(color: _getStatusColor(_getValue(riwayat, 'status'))),
              ),
              Text("Tanggal: ${isBooking ? _getValue(riwayat, 'tanggalBooking') : _getValue(riwayat, 'tanggalSelesai')}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Tutup"),
            ),
          ],
        );
      },
    );
  }

  String _getValue<T>(T obj, String property) {
    final Map<String, dynamic> map = {
      if (obj is RiwayatBooking) ...{
        "nopol": obj.nopol,
        "merk": obj.merk,
        "cc": obj.cc,
        "jenisMotor": obj.jenisMotor,
        "tahunMotor": obj.tahunMotor,
        "status": obj.status,
        "tanggalBooking": obj.tanggalBooking,
      },
      if (obj is RiwayatServis) ...{
        "nopol": obj.nopol,
        "merk": obj.merk,
        "cc": obj.cc,
        "jenisMotor": obj.jenisMotor,
        "tahunMotor": obj.tahunMotor,
        "status": obj.status,
        "tanggalSelesai": obj.tanggalSelesai,
      }
    };

    return map[property] ?? "-";
  }
}
