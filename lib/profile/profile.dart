import 'package:bengkel_flutter/home/notifikasi.dart';
import 'package:bengkel_flutter/profile/addkendaraan.dart';
import 'package:bengkel_flutter/profile/edit/editprofile.dart';
import 'package:bengkel_flutter/profile/edit/editkendaraan.dart';
import 'package:flutter/material.dart';
import 'tutorial.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const User());
}

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String namaPelanggan = 'Loading...'; // Nilai default sebelum data didapatkan
  bool _showinfokendaraan =
      true; // State untuk menampilkan/sembunyikan info kendaraan
  bool _showTutorial = true; // State untuk menampilkan/sembunyikan tutorial

  @override
  void initState() {
    super.initState();
    _getNamaPelanggan(); // Ambil nama pelanggan saat halaman dibuka
  }

  // Fungsi untuk mengambil nama pelanggan dari SharedPreferences
  Future<void> _getNamaPelanggan() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      namaPelanggan = prefs.getString('nama_pelanggan') ?? 'Guest';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 170,
            floating: false,
            pinned: true,
            backgroundColor: Colors.red,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            title: const SizedBox.shrink(),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/user_placeholder.png'),
                  ),
                  const SizedBox(height: 16),
                 Text(
                    'Hai, $namaPelanggan!', 
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Transform.translate(
                offset: const Offset(-10.0, 0), // Geser ke kiri
                child: IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/bell_32.png'),
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NotifikasiScreen(), // Navigasi ke NotifikasiScreen
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Box Tutorial
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: InkWell(
                        onTap: () {
                          // Navigasi ke halaman TutorialScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TutorialScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              // Ikon YouTube di sebelah kiri
                              const Icon(
                                Icons.play_circle_filled, // Ikon mirip YouTube
                                size: 40,
                                color: Colors.red, // Warna ikon merah
                              ),
                              const SizedBox(
                                  width: 12), // Jarak antara ikon dan teks
                              // Label "Tutorial"
                              const Text(
                                'Tutorial',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(), // Mengisi ruang kosong di antara label dan ikon panah
                              // Ikon panah
                              const Icon(
                                Icons.chevron_right,
                                size: 24,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Card untuk Edit Profile
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: InkWell(
                        onTap: () {
                          // Navigasi ke halaman EditProfileScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfileScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              // Ikon edit profile di sebelah kiri
                              const Icon(
                                Icons.edit, // Ikon edit
                                size: 30,
                                color: Colors.blue, // Warna ikon biru
                              ),
                              const SizedBox(
                                  width: 12), // Jarak antara ikon dan teks
                              // Label "Edit Profile"
                              const Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(), // Mengisi ruang kosong di antara label dan ikon panah
                              // Ikon panah ke kanan
                              const Icon(
                                Icons.chevron_right, // Ikon ">"
                                size: 24,
                                color: Colors.grey, // Warna ikon abu-abu
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Card untuk tambah kendaraan
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: InkWell(
                        onTap: () {
                          // Navigasi ke halaman addkendaraan
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddKendaraanScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              // Ikon edit profile di sebelah kiri
                              Image.asset(
                                'assets/scooter.png', // Path ke gambar kustom
                                width: 30, // Sesuaikan ukuran gambar
                                height: 30,
                              ),
                              const SizedBox(
                                  width: 12), // Jarak antara ikon dan teks
                              // Label "Edit Profile"
                              const Text(
                                'Tambah kendaraan',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(), // Mengisi ruang kosong di antara label dan ikon panah
                              // Ikon panah ke kanan
                              const Icon(
                                Icons.chevron_right,
                                size: 24,
                                color: Colors.grey, // Warna ikon abu-abu
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        const Text(
                          'Kendaraan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Saya :',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Transform.rotate(
                          angle:
                              1.57, // Sudut rotasi 90 derajat (menghadap ke samping)
                          child: IconButton(
                            icon: Icon(
                              _showinfokendaraan
                                  ? Icons.arrow_forward
                                  : Icons.arrow_back,
                            ),
                            onPressed: () {
                              setState(() {
                                _showinfokendaraan =
                                    !_showinfokendaraan; // Toggle state
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    if (_showinfokendaraan) // Tampilkan info kendaraan jika _showinfokendaraan true
                      Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Icon(
                                          Icons.motorcycle,
                                          size: 40,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Motor',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Nomor Polisi: B 1234 XYZ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Merek: Honda'),
                                        Text('CC: 150 CC'),
                                        Text('Jenis: Motor Sport'),
                                        Text('Tahun: 2022'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // Ikon edit di pojok kanan bawah
                              Positioned(
                                right: 10,
                                bottom: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder:
                                                (context) => // klik menuju edit kendaraan
                                                    EditKendaraanScreen()));
                                  },
                                  child: Image.asset(
                                    'assets/edit.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
