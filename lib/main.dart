import 'package:bengkel_flutter/home/belanja.dart';
import 'package:bengkel_flutter/home/konsultasi.dart';
import 'package:bengkel_flutter/home/notifikasi.dart';
import 'package:bengkel_flutter/login_regis/login.dart';
import 'package:flutter/material.dart';
import 'profile/profile.dart';
import 'booking/bookingjadwal.dart';
import 'riwayat/riwayat.dart';
import 'home/belanja.dart';
import 'home/paketservice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bengkel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainScreen(), // Tampilkan MainScreen sebagai halaman utama
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Indeks untuk BottomNavigationBar

  // Daftar halaman yang sesuai dengan item BottomNavigationBar
  final List<Widget> _pages = [
    const HomePage(), // home page
    const RiwayatScreen(), // history page
    const BookingScreen(), // booking page
    const LocationPage(), // location page
    const UserProfileScreen(), // profile page
  ];

  // Fungsi untuk mengubah halaman saat item BottomNavigationBar diklik
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Hilangkan AppBar
      body: _pages[_selectedIndex], // Tampilkan halaman yang dipilih

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Indeks yang aktif
        onTap: _onItemTapped, // Fungsi saat item diklik
        type: BottomNavigationBarType.fixed, // Agar semua item terlihat
        selectedItemColor: Colors.blue, // Warna item yang aktif
        unselectedItemColor: Colors.grey, // Warna item yang tidak aktif
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Lokasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// Halaman Home
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tidak menggunakan AppBar
      body: Stack(
        children: [
          // Container kuning di belakang (separo tinggi halaman)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.27, // Tinggi halaman
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue, // Warna biru di sebelah kiri
                    Colors.red, // Warna merah di sebelah kanan
                  ],
                  begin: Alignment.bottomLeft, // Mulai dari kiri tengah
                  end: Alignment.topRight, // Berakhir di kanan tengah
                ),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20), // Sudut lengkung di bagian bawah
                ),
              ),
            ),
          ),
          // Konten utama
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // Bagian atas: Gambar profil, label, dan ikon lonceng
                Row(
                  children: [
                    // Gambar profil
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/profil.png'),
                    ),
                    const SizedBox(width: 12),
                    // Label "Hai, nama user..."
                    const Text(
                      'Hai, Dhafa Bintang...',
                      style: TextStyle(
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    // Ikon lonceng
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotifikasiScreen()));
                      },
                      child: Image.asset(
                        'assets/bell_32.png', // Path ke gambar bell.png
                        width: 24, // Sesuaikan ukuran gambar
                        height: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: 10), // Jarak antara bagian atas dan konten

                // Saldo dan Point Box
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 224, 19, 19), // Merah muda
                        const Color.fromARGB(255, 37, 130, 250), // Merah tua
                      ],
                      begin: Alignment
                          .topLeft, // Arah gradient dimulai dari kiri atas
                      end: Alignment
                          .bottomRight, // Arah gradient berakhir di kanan bawah
                    ),
                    borderRadius: BorderRadius.circular(8), // Sudut melengkung
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Card(
                    elevation: 0, // Hilangkan shadow bawaan Card
                    color: Colors.transparent, // Buat Card transparan
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Bagian Saldo dan Point
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Saldo Anda: Rp. ***** || ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Warna teks putih
                                ),
                              ),
                              const Text(
                                'Point Anda: 1200',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Warna teks putih
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                              height: 16), // Spasi antara saldo dan fitur

                          // Bagian 3 Elements (Belanja, Paket Service, Konsultasi)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildElement(
                                icon: 'assets/belanja.png',
                                title: 'Belanja',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BelanjaScreen(),
                                    ),
                                  );
                                },
                                offset: const Offset(
                                    10, 0), // geser gambar ke kanan
                                textOffset:
                                    const Offset(15, 0), // Geser teks ke kanan
                              ),
                              _buildElement(
                                icon: 'assets/mechanic.png',
                                title: 'Paket Service',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PaketserviceScreen(),
                                    ),
                                  );
                                },
                                offset:
                                    const Offset(7, 0), // geser gambar ke kiri
                                textOffset:
                                    const Offset(7, 0), // Geser teks ke kiri
                              ),
                              _buildElement(
                                icon: 'assets/consultant_64.png',
                                title: 'Konsultasi',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => KonsultasiScreen(),
                                    ),
                                  );
                                },
                                offset: const Offset(
                                    -10, 0), // geser gambar ke kiri
                                textOffset:
                                    const Offset(-10, 0), // Geser teks ke kiri
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Akses Cepat Section
                const SizedBox(height: 16),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Akses', // Teks "Akses"
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red, // Warna merah
                        ),
                      ),
                      TextSpan(
                        text: '  ', // Spasi manual (2 spasi)
                      ),
                      TextSpan(
                        text: 'Cepat', // Teks "Cepat"
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Warna hitam
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Akses Cepat Box
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      'Info terbaru dari service kendaraan anda akan terinfokan di sini',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),

                // Promo Terbaru Section
                const SizedBox(height: 16),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Promo', // Teks "Promo"
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red, // Warna merah
                        ),
                      ),
                      TextSpan(
                        text: '  ', // Spasi manual (2 spasi)
                      ),
                      TextSpan(
                        text: 'Terbaru', // Teks "Terbaru"
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black, // Warna hitam
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // Kode Promo TextBox
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Masukkan kode promo',
                    border: OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.card_giftcard),
                  ),
                ),

                // promo
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: const Text(
                      'Info promo akan tertampil di sini',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build each element card (Belanja, Paket Service, Konsultasi)
  Widget _buildElement({
    required String icon,
    required String title,
    required VoidCallback onTap,
    Offset offset = Offset.zero, // Opsional: untuk menggeser gambar
    Offset textOffset = Offset.zero, // Opsional: untuk menggeser teks
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Transform.translate(
            offset: offset, // Geser gambar sesuai nilai offset
            child: Image.asset(
              icon,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(height: 8),
          Transform.translate(
            offset: textOffset, // Geser teks sesuai nilai textOffset
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman Riwayat
class RiwaYat extends StatelessWidget {
  const RiwaYat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RiwayatScreen()));
          },
        ),
      ),
    );
  }
}

// Halaman booking
class BooKing extends StatelessWidget {
  const BooKing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookingScreen()),
            );
          },
        ),
      ),
    );
  }
}

// Halaman Lokasi
class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Halaman Lokasi',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserProfileScreen()),
          );
        },
      ),
    ),
  );
}
