import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String? selectedVehicle;
  String? selectedServicePackage;
  DateTime? selectedDate;
  final TextEditingController complaintController = TextEditingController();

  final List<String> vehicles = ['Mobil', 'Motor', 'Sepeda'];
  List<String> servicePackages = [];

  @override
  void initState() {
    super.initState();
  }
  
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
      appBar: AppBar(title: const Text('Booking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input kalender dengan ikon tanggal
            InkWell(
              onTap: () => 
              _selectDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Pilih Tanggal',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
                child: Text(
                  selectedDate != null
                      ? "${selectedDate!.toLocal()}".split(' ')[0]
                      : 'Pilih Tanggal',
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown Jenis Kendaraan
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
                ...vehicles.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ],
              decoration: InputDecoration(
                labelText: 'Jenis Kendaraan',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),

            const SizedBox(height: 20),

            // Input Keluhan
            TextField(
              controller: complaintController,
              decoration: InputDecoration(
                labelText: 'Keluhan',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 130),

            // Tombol Booking
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
                  final vehicle = selectedVehicle;
                  final complaint = complaintController.text;
                  final date = selectedDate;

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
                            Text('Keluhan: $complaint'),
                            Text(
                                'Tanggal: ${date != null ? "${date.toLocal()}".split(' ')[0] : "Tidak dipilih"}'),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 16), // Padding tombol
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
