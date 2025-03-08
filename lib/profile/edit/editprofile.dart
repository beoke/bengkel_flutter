import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noKtpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? noKtp = prefs.getString('ktp_pelanggan');

    if (noKtp != null) {  
      final response = await http.get(
        Uri.parse('http://192.168.1.65:5000/api/Pelanggan/profile/$noKtp'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          namaController.text = data['nama_pelanggan'];
          emailController.text = data['email'];
          noKtpController.text = data['ktp_pelanggan'];
          passwordController.text = data['password'];
          noTelpController.text = data['no_telp'];
          alamatController.text = data['alamat'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // CircleAvatar untuk gambar profil
            GestureDetector(
              onTap: () {
                // Tambahkan logika untuk memilih gambar dari folder
              },
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/default_profile.png'),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.camera_alt, color: Colors.white, size: 30),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
