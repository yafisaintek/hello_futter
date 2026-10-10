import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ProfileCardPage(),
    );
  }
}

class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kartu Profil'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Responsive design: > 600px berdampingan (Row), <= 600px bertumpuk (Column)
                  bool isWideScreen = constraints.maxWidth > 600;

                  return ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: isWideScreen
                        ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildProfileAvatar(),
                        const SizedBox(width: 24),
                        Expanded(child: _buildProfileInfo(context)),
                      ],
                    )
                        : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildProfileAvatar(),
                        const SizedBox(height: 20),
                        _buildProfileInfo(context),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk foto profil dengan Badge "Available" menggunakan Stack + Positioned
  Widget _buildProfileAvatar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircleAvatar(
          radius: 60,
          backgroundColor: Colors.indigoAccent,
          child: CircleAvatar(
            radius: 56,
            backgroundImage: AssetImage(
              'assets/foto_saya.jpg',
            ),
          ),
        ),
        Positioned(
          bottom: 2,
          right: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Text(
              'Available',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget untuk informasi profil, kontak, dan skill
  Widget _buildProfileInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Yafi Mahardika',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'NIM: 4124046',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          'Universitas Pesantren Tinggi Darul Ulum Jombang',
          style: TextStyle(
            fontSize: 13,
            fontStyle: FontStyle.italic,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          'Mahasiswa Sistem Informasi',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          '"Mahasiswa semester 5 yang sedang belajar UI Flutter."',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),

        // Row berisi 3 ikon sosial media / kontak secara horizontal
        Row(
          children: const [
            Icon(Icons.email_outlined, color: Colors.indigo),
            SizedBox(width: 16),
            Icon(Icons.phone_outlined, color: Colors.indigo),
            SizedBox(width: 16),
            Icon(Icons.code, color: Colors.indigo), // Ikon merepresentasikan GitHub
          ],
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 8),

        // Minimal 3 skill dalam bentuk Chip menggunakan Wrap
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: const [
            Chip(
              label: Text('Flutter'),
              backgroundColor: Colors.blueAccent,
              labelStyle: TextStyle(color: Colors.white),
            ),
            Chip(
              label: Text('Dart'),
              backgroundColor: Colors.cyan,
              labelStyle: TextStyle(color: Colors.white),
            ),
            Chip(
              label: Text('Laravel'),
              backgroundColor: Colors.redAccent,
              labelStyle: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}