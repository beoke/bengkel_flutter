import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '/main.dart'; // Import halaman dashboard

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
        // home: LoginPage(), // Menetapkan halaman LoginPage sebagai halaman utama
      ),
    );

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller untuk mengambil nilai dari TextField
    final ktpController = TextEditingController(); // Controller untuk No - KTP
    final passwordController =
        TextEditingController(); // Controller untuk Password

    return Scaffold(
      body: Container(
        width: double.infinity, // Lebar container mengisi layar
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, // Gradien dimulai dari atas
            colors: [
              Colors.orange.shade900, // Warna gradien oranye tua
              Colors.orange.shade800, // Warna gradien oranye sedang
              Colors.orange.shade400, // Warna gradien oranye muda
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Konten diatur ke kiri
          children: <Widget>[
            const SizedBox(height: 40), // Jarak dari atas
            Padding(
              padding: const EdgeInsets.all(20), // Padding untuk judul
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Teks diatur ke kiri
                children: <Widget>[
                  FadeInUp(
                    duration: const Duration(
                        milliseconds: 1000), // Animasi selama 1 detik
                    child: const Text(
                      "Login", // Judul "Login"
                      style: TextStyle(
                          color: Colors.white, fontSize: 40), // Gaya teks
                    ),
                  ),
                  const SizedBox(height: 10), // Jarak antara judul dan subjudul
                  FadeInUp(
                    duration: const Duration(
                        milliseconds: 1300), // Animasi selama 1.3 detik
                    child: const Text(
                      "Welcome Back", // Subjudul "Welcome Back"
                      style: TextStyle(
                          color: Colors.white, fontSize: 18), // Gaya teks
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Jarak antara judul dan konten utama
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white, // Warna latar belakang putih
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60), // Sudut kiri atas melengkung
                    topRight:
                        Radius.circular(60), // Sudut kanan atas melengkung
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(40), // Padding untuk konten
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 30), // Jarak sebelum TextField
                        // TextField No - KTP
                        FadeInUp(
                          duration: const Duration(
                              milliseconds: 1400), // Animasi selama 1.4 detik
                          child: Container(
                            width: double.infinity, // Lebar penuh
                            decoration: BoxDecoration(
                              color: Colors.white, // Warna latar belakang putih
                              borderRadius:
                                  BorderRadius.circular(50), // Sudut melengkung
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                      225, 95, 27, .3), // Bayangan oranye
                                  blurRadius: 20, // Tingkat blur bayangan
                                  offset: Offset(0, 10), // Posisi bayangan
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20), // Padding horizontal
                              child: TextField(
                                controller:
                                    ktpController, // Controller untuk No - KTP
                                decoration: const InputDecoration(
                                  hintText:
                                      "No - KTP", // Placeholder untuk No - KTP
                                  hintStyle: TextStyle(
                                      color: Colors.grey), // Gaya placeholder
                                  border: InputBorder
                                      .none, // Menghilangkan border default
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            height: 20), // Jarak antara No - KTP dan Password
                        // TextField Password
                        FadeInUp(
                          duration: const Duration(
                              milliseconds: 1600), // Animasi selama 1.6 detik
                          child: Container(
                            width: double.infinity, // Lebar penuh
                            decoration: BoxDecoration(
                              color: Colors.white, // Warna latar belakang putih
                              borderRadius:
                                  BorderRadius.circular(50), // Sudut melengkung
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(
                                      225, 95, 27, .3), // Bayangan oranye
                                  blurRadius: 20, // Tingkat blur bayangan
                                  offset: Offset(0, 10), // Posisi bayangan
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20), // Padding horizontal
                              child: TextField(
                                controller:
                                    passwordController, // Controller untuk Password
                                obscureText:
                                    true, // Menyembunyikan teks password
                                decoration: const InputDecoration(
                                  hintText:
                                      "Password", // Placeholder untuk Password
                                  hintStyle: TextStyle(
                                      color: Colors.grey), // Gaya placeholder
                                  border: InputBorder
                                      .none, // Menghilangkan border default
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            height:
                                10), // Jarak antara TextField dan Forgot Password
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10), // Padding horizontal
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.end, // Teks diatur ke kanan
                            children: [
                              FadeInUp(
                                duration: const Duration(
                                    milliseconds:
                                        1500), // Animasi selama 1.5 detik
                                child: const Text(
                                  "Forgot Password?", // Teks "Forgot Password"
                                  style: TextStyle(
                                      color: Colors.purple), // Gaya teks ungu
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            height:
                                100), // Jarak antara Forgot Password dan tombol Login
                        FadeInUp(
                          duration: const Duration(
                              milliseconds: 1700), // Animasi selama 1.7 detik
                          child: MaterialButton(
                            onPressed: () {
                              // Validasi sederhana
                              if (ktpController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "No - KTP dan password tidak boleh kosong!"), // Pesan error
                                  ),
                                );
                              } else {
                                // Navigasi ke halaman dashboard setelah login
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainScreen(),
                                  ),
                                );
                              }
                            },
                            height: 50, // Tinggi tombol
                            color:
                                Colors.orange[900], // Warna tombol oranye tua
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  50), // Sudut tombol melengkung
                            ),
                            child: const Center(
                              child: Text(
                                "Login", // Teks tombol
                                style: TextStyle(
                                  color: Colors.white, // Warna teks putih
                                  fontWeight: FontWeight.bold, // Teks tebal
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            height:
                                20), // Jarak antara tombol Login dan Create Akun
                        FadeInUp(
                          duration: const Duration(
                              milliseconds: 1800), // Animasi selama 1.8 detik
                          child: MaterialButton(
                            onPressed: () {
                              // Navigasi ke halaman create akun
                              // Misalnya: Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountPage()));
                            },
                            height: 50, // Tinggi tombol
                            color: Colors.blue, // Warna tombol biru
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  50), // Sudut tombol melengkung
                            ),
                            child: const Center(
                              child: Text(
                                "Create Akun", // Teks tombol
                                style: TextStyle(
                                  color: Colors.white, // Warna teks putih
                                  fontWeight: FontWeight.bold, // Teks tebal
                                ),
                              ),
                            ),
                          ),
                        ),
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
}
