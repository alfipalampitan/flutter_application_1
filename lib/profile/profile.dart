// Tambahkan di bagian import
import 'package:flutter/material.dart';
import 'package:flutter_application_1/IsiSaldo/isi_saldo_page.dart';
import 'package:flutter_application_1/aktivitas/aktivitas.dart';
import 'package:flutter_application_1/kirim/kirim.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/minta/Minta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil DANA',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
    routes: {
         // Halaman utama
      '/home': (context) => DanaHome(),
      '/aktivitas': (context) => WalletScreen(),
      '/minta': (context) => MintaUangPage(),
      '/kirim': (context) => KirimUangPage(),
      '/isiSaldo': (context) => IsiSaldoPage(),
      '/profile': (context) => DanaProfileScreen(),
    },
      home: DanaProfileScreen(),
    );
  }
}

class DanaProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Profil DANA", style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code),
            onPressed: () {
              // Aksi untuk QR Code
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Profil
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.blue,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        ''), // Ganti dengan URL foto pengguna
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MUHAMMAD RAFIQI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '0823••••9447',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Section Saldo, DANA Goals, Rek. Keluarga, DANA+, eMAS
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildColumnItem(
                        icon: Icons.account_balance_wallet,
                        title: 'Saldo',
                        subtitle: 'Rp 4.993',
                        onTap: () {
                          // Aksi untuk Saldo
                        },
                      ),
                      Divider(thickness: 1.0, color: Colors.grey[300]),
                      _buildColumnItem(
                        icon: Icons.flag,
                        title: 'DANA Goals',
                        subtitle: 'Buat Impian',
                        onTap: () {
                          // Aksi untuk DANA Goals
                        },
                      ),
                      Divider(thickness: 1.0, color: Colors.grey[300]),
                      _buildColumnItem(
                        icon: Icons.group,
                        title: 'Rek. Keluarga',
                        subtitle: 'Aktivasi Yuk!',
                        onTap: () {
                          // Aksi untuk Rek. Keluarga
                        },
                      ),
                      Divider(thickness: 1.0, color: Colors.grey[300]),
                      _buildColumnItem(
                        icon: Icons.add_circle,
                        title: 'DANA+',
                        subtitle: 'Mulai Investasi',
                        onTap: () {
                          // Aksi untuk DANA+
                        },
                      ),
                      Divider(thickness: 1.0, color: Colors.grey[300]),
                      _buildColumnItem(
                        icon: Icons.monetization_on,
                        title: 'eMAS',
                        subtitle: 'Mulai Inves Yuk',
                        onTap: () {
                          // Aksi untuk eMAS
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Section Pengaturan
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildSettingRow(
                    context,
                    icon: Icons.person,
                    title: 'Pengaturan Profil',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileSettingsPage(),
                        ),
                      );
                    },
                  ),
                  _buildSettingRow(
                    context,
                    icon: Icons.lock,
                    title: 'Pengaturan Keamanan',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecuritySettingsPage(),
                        ),
                      );
                    },
                  ),
                  _buildSettingRow(
                    context,
                    icon: Icons.notifications,
                    title: 'Pengaturan Notifikasi',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationSettingsPage(),
                        ),
                      );
                    },
                  ),
                  _buildSettingRow(
                    context,
                    icon: Icons.verified,
                    title: 'Verifikasi',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerificationPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Tombol Keluar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 87, 72, 199),
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  // Aksi untuk Keluar
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.exit_to_app, color: Colors.white),
                    SizedBox(width: 8.0),
                    Text(
                      'Keluar',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/Dana-logo.png',
              width: 40,
              height: 20,
              color: Colors.grey,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/receipt.png',
              width: 40,
              height: 20,
              color: Colors.grey,
            ),
            label: 'Aktivitas',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 60,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.qr_code,
                color: Colors.white,
                size: 30,
              ),
            ),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.getPocket,
              color: Colors.grey,
            ),
            label: 'Dompet',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: 'Saya',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home'); // Navigasi ke halaman Beranda
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/aktivitas'); // Navigasi ke halaman Aktivitas
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/minta'); // Navigasi ke halaman Pay
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/kirim'); // Navigasi ke halaman Dompet
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/isiSaldo'); // Navigasi ke halaman Dompet
              break;
            case 5:
              Navigator.pushReplacementNamed(context, '/profile'); // Navigasi ke halaman Saya
              break;
          }
        },
      ),
    );
  }

  // Widget untuk Elemen Kolom
  Widget _buildColumnItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk Pengaturan
  Widget _buildSettingRow(BuildContext context,
      {required IconData icon, required String title, required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            SizedBox(width: 16.0),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

// Halaman Pengaturan Profil
class ProfileSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.edit, color: Colors.blue),
              title: Text('Edit Profil'),
              onTap: () {
                // Aksi untuk Edit Profil
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.photo, color: Colors.blue),
              title: Text('Ganti Foto Profil'),
              onTap: () {
                // Aksi untuk Ganti Foto Profil
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.blue),
              title: Text('Lihat Profil'),
              onTap: () {
                // Aksi untuk Lihat Profil
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Pengaturan Keamanan
class SecuritySettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Keamanan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.lock, color: Colors.blue),
              title: Text('Ganti Password'),
              onTap: () {
                // Aksi untuk Ganti Password
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.fingerprint, color: Colors.blue),
              title: Text('Aktifkan Fingerprint'),
              onTap: () {
                // Aksi untuk Aktifkan Fingerprint
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.security, color: Colors.blue),
              title: Text('Keamanan Dua Langkah'),
              onTap: () {
                // Aksi untuk Keamanan Dua Langkah
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Pengaturan Notifikasi
class NotificationSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan Notifikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.blue),
              title: Text('Aktifkan Notifikasi'),
              onTap: () {
                // Aksi untuk Aktifkan Notifikasi
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications_off, color: Colors.blue),
              title: Text('Nonaktifkan Notifikasi'),
              onTap: () {
                // Aksi untuk Nonaktifkan Notifikasi
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.toggle_on, color: Colors.blue),
              title: Text('Notifikasi Tertentu'),
              onTap: () {
                // Aksi untuk Notifikasi Tertentu
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Verifikasi
class VerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verifikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.email, color: Colors.blue),
              title: Text('Verifikasi Email'),
              onTap: () {
                // Aksi untuk Verifikasi Email
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.blue),
              title: Text('Verifikasi Nomor Telepon'),
              onTap: () {
                // Aksi untuk Verifikasi Nomor Telepon
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.verified, color: Colors.blue),
              title: Text('Verifikasi Identitas'),
              onTap: () {
                // Aksi untuk Verifikasi Identitas
              },
            ),
          ],
        ),
      ),
    );
  }
}