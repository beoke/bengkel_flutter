import 'package:flutter/material.dart';

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
  bool _showVehicleInfo = true; // State untuk menampilkan/sembunyikan info kendaraan

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
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                color: Colors.white,
                onPressed: () {
                  // Aksi ketika ikon lonceng diklik
                },
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
                    // Kendaraan Section
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
                        IconButton(
                          icon: Icon(
                            _showVehicleInfo
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                          ),
                          onPressed: () {
                            setState(() {
                              _showVehicleInfo = !_showVehicleInfo; // Toggle state
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    if (_showVehicleInfo) // Tampilkan info kendaraan jika _showVehicleInfo true
                      Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Nomor Polisi: B 1234 XYZ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
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