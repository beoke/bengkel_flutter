import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registrasi Pelanggan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  // Controller untuk mengambil nilai input
  final TextEditingController ktpController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi Pelanggan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(ktpController, 'No KTP', TextInputType.number),
              _buildTextField(namaController, 'Nama Pelanggan', TextInputType.text),
              _buildTextField(emailController, 'Email', TextInputType.emailAddress),
              _buildTextField(passwordController, 'Password', TextInputType.visiblePassword, isPassword: true),
              _buildTextField(telpController, 'No Telepon', TextInputType.phone),
              _buildTextField(alamatController, 'Alamat', TextInputType.text, maxLines: 3),

              const SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Lakukan proses pendaftaran (misalnya kirim ke API)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Registrasi Berhasil!')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    TextInputType inputType, {
    bool isPassword = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: isPassword,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }
}
