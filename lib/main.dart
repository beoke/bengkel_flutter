import 'package:bengkel_flutter/login_regis/login.dart';
import 'package:flutter/material.dart';
import 'user.dart';

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
    const HistoryPage(), // history page
    const BookingPage(), // booking page
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Bagian atas: Gambar profil, label, dan ikon lonceng
            Row(
              children: [
                // Gambar profil
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                      'assets/profile_pic.jpg'), // Ganti dengan gambar profil
                ),
                const SizedBox(width: 12),
                // Label "Hai, nama user..."
                const Text(
                  'Hai, nama user...',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                // Ikon lonceng
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {}, // arah ketika di klik
                ),
              ],
            ),
            const SizedBox(height: 30), // Jarak antara bagian atas dan konten

            // Saldo dan Point Box
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 224, 19, 19), // Merah muda
                    const Color.fromARGB(255, 37, 130, 250), // Merah tua
                  ],
                  begin:
                      Alignment.topLeft, // Arah gradient dimulai dari kiri atas
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
                            'Saldo Anda: Rp. *****    || ',
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
                            icon: Icons.shopping_cart,
                            title: 'Belanja',
                            onTap: () {},
                          ),
                          _buildElement(
                            icon: Icons.build,
                            title: 'Paket Service',
                            onTap: () {},
                          ),
                          _buildElement(
                            icon: Icons.chat,
                            title: 'Konsultasi',
                            onTap: () {},
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
    );
  }

  // Function to build each element card (Belanja, Paket Service, Konsultasi)
  Widget _buildElement({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}

// Halaman Riwayat
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Halaman Riwayat',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Halaman Booking
class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Halaman Booking',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
              MaterialPageRoute(
                  builder: (context) => const UserProfileScreen()),
            );
          },
        ),
      ),
    );
  }

