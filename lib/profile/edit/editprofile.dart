import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EditProfileScreen extends StatefulWidget {
  final String ktpPelanggan; // Terima No KTP dari Login

  const EditProfileScreen({super.key, required this.ktpPelanggan});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noKtpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  bool _isLoading = true;
  bool _dataNotFound = false;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    final response = await http.get(
      Uri.parse('http://192.168.2.212:5000/api/Pelanggan/profile/${widget.ktpPelanggan}'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data == null || data.isEmpty) {
        _showErrorAndExit("Data tidak ditemukan.");
        return;
      }

      setState(() {
        namaController.text = data['nama_pelanggan'] ?? '';
        emailController.text = data['email'] ?? '';
        noKtpController.text = data['ktp_pelanggan'] ?? '';
        passwordController.text = data['password'] ?? '';
        noTelpController.text = data['no_telp'] ?? '';
        alamatController.text = data['alamat'] ?? '';
        _isLoading = false;
      });
    } else {
      _showErrorAndExit("Data tidak ditemukan.");
    }
  }

  void _showErrorAndExit(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });

    setState(() {
      _dataNotFound = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _dataNotFound
              ? const SizedBox()
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildTextField("Nama Lengkap", namaController),
                      _buildTextField("Email", emailController),
                      _buildTextField("No KTP", noKtpController, readOnly: true),
                      _buildTextField("Password", passwordController, obscureText: true),
                      _buildTextField("No Telp", noTelpController),
                      _buildTextField("Alamat", alamatController),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan logika untuk menyimpan perubahan
                        },
                        child: const Text('Simpan Perubahan'),
                      ),
                    ],
                  ),
                ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool obscureText = false, bool readOnly = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
