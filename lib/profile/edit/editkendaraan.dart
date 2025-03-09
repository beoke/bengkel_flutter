import 'package:flutter/material.dart';

class EditKendaraanScreen extends StatefulWidget {
  final Map<String, dynamic> kendaraan;

  const EditKendaraanScreen({Key? key, required this.kendaraan}) : super(key: key);

  @override
  _EditKendaraanScreenState createState() => _EditKendaraanScreenState();
}

class _EditKendaraanScreenState extends State<EditKendaraanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Edit Kendaraan")),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nomor Polisi: ${widget.kendaraan['nomor_polisi']}"),
          Text("Merek: ${widget.kendaraan['merek']}"),
          Text("CC: ${widget.kendaraan['cc']}"),
          Text("Jenis: ${widget.kendaraan['jenis']}"),
          Text("Tahun: ${widget.kendaraan['tahun']}"),
        ],
      ),
    ),
  );
  }
}
