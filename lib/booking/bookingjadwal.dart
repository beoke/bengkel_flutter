// booking/bookingjadwal.dart
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String? selectedVehicle;
  String? selectedServicePackage;
  DateTime? selectedDate;
  final TextEditingController locationController = TextEditingController();
  final TextEditingController complaintController = TextEditingController();

  final List<String> vehicles = ['Mobil', 'Motor', 'Sepeda'];
  final List<String> servicePackages = ['Paket Basic', 'Paket Standard', 'Paket Premium'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ComboBox untuk memilih jenis kendaraan
            DropdownButtonFormField<String>(
              value: selectedVehicle,
              onChanged: (String? newValue) {
                setState(() {
                  selectedVehicle = newValue;
                });
              },
              items: [
                const DropdownMenuItem<String>(
                  value: null,
                  child: Text('Pilih Jenis Kendaraan'),
                ),
                ...vehicles.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ],
              decoration: const InputDecoration(
                labelText: 'Jenis Kendaraan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // TextField untuk memilih lokasi
            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                labelText: 'Lokasi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // ComboBox untuk memilih jenis paket service
            DropdownButtonFormField<String>(
              value: selectedServicePackage,
              onChanged: (String? newValue) {
                setState(() {
                  selectedServicePackage = newValue;
                });
              },
              items: [
                const DropdownMenuItem<String>(
                  value: null,
                  child: Text('Pilih Jenis Paket Service'),
                ),
                ...servicePackages.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ],
              decoration: const InputDecoration(
                labelText: 'Jenis Paket Service',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // TextField untuk mengisi keluhan
            TextField(
              controller: complaintController,
              decoration: const InputDecoration(
                labelText: 'Keluhan',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),

            // Input kalender dengan ikon tanggal
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Pilih Tanggal',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                child: Text(
                  selectedDate != null
                      ? "${selectedDate!.toLocal()}".split(' ')[0]
                      : 'Pilih Tanggal',
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol untuk melakukan booking dengan gradient
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.green], // Warna gradient
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8), // Border radius
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Lakukan sesuatu dengan data yang diinput
                  final vehicle = selectedVehicle;
                  final location = locationController.text;
                  final servicePackage = selectedServicePackage;
                  final complaint = complaintController.text;
                  final date = selectedDate;

                  // Contoh: Tampilkan data yang diinput
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Booking Detail'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Jenis Kendaraan: $vehicle'),
                            Text('Lokasi: $location'),
                            Text('Paket Service: $servicePackage'),
                            Text('Keluhan: $complaint'),
                            Text('Tanggal: ${date != null ? "${date.toLocal()}".split(' ')[0] : "Tidak dipilih"}'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Warna latar transparan
                  shadowColor: Colors.transparent, // Hilangkan shadow
                  padding: const EdgeInsets.symmetric(vertical: 16), // Padding tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Border radius
                  ),
                ),
                child: const Text(
                  'Booking',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}