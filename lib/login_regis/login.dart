import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/main.dart';
import 'registrasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController ktpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? namaPelanggan; // simpan nama pelanggan
  bool isLoading = false; // Indikator loading

  Future<void> login() async {
    if (ktpController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("No - KTP dan password tidak boleh kosong!")),
      );
      return;
    }

    setState(() {
      isLoading = true; // Menampilkan indikator loading
    });

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.65:5000/api/Pelanggan/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'ktp_pelanggan': ktpController.text,
          'password': passwordController.text,
        }),
      );

      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200 &&
          responseData['nama_pelanggan'] != null) {
        String namaPelanggan =
            responseData['nama_pelanggan']; // Ambil nama pelanggan
        String noKtp = responseData['ktp_pelanggan']; // Ambil no KTP

        // Simpan nama pelanggan ke SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('nama_pelanggan', namaPelanggan);
        await prefs.setString('ktp_pelanggan', noKtp); // Simpan no KTP

        // Pindah ke MainScreen dengan nama pelanggan
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MainScreen(namaPelanggan: namaPelanggan)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'] ?? "Login gagal!")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Terjadi kesalahan, coba lagi!")),
      );
    }

    setState(() {
      isLoading = false; // Sembunyikan indikator loading
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Colors.red.shade900,
              Colors.orange.shade800,
              Colors.orange.shade400,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Selamat Datang",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "TECHNO GARAGE",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 30),
                        _buildTextField(ktpController, "No - KTP", false),
                        const SizedBox(height: 20),
                        _buildTextField(passwordController, "Password", true),
                        const SizedBox(height: 50),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text("Forgot Password?",
                              style: TextStyle(color: Colors.purple)),
                        ),
                        const SizedBox(height: 50),
                        isLoading
                            ? const CircularProgressIndicator()
                            : _buildLoginButton(),
                        const SizedBox(height: 20),
                        _buildRegisterButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hint, bool isPassword) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(225, 95, 27, .3),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return MaterialButton(
      onPressed: login,
      height: 50,
      color: Colors.orange[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: const Center(
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RegistrationPage()));
      },
      height: 50,
      color: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: const Center(
        child: Text(
          "Create Akun",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
