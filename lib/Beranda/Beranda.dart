import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_application_1/IsiSaldo/isi_saldo_page.dart';
import 'package:flutter_application_1/aktivitas/aktivitas.dart';
import 'package:flutter_application_1/kirim/kirim.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/minta/Minta.dart';
import 'package:flutter_application_1/profile/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import FontAwesome

void main() {
  runApp(MyApp());
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0; // Untuk efek fade-in
  double _position = -100; // Untuk efek slide-in

  @override
  void initState() {
    super.initState();

    // Jalankan animasi saat halaman dimuat
    Timer(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0; // Mulai animasi fade-in
        _position = 0; // Geser logo ke posisi final
      });
    });

    // Navigasi ke halaman utama setelah 3 detik
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animasi Slide-in dan Fade-in Logo
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  top: MediaQuery.of(context).size.height / 2 + _position,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: _opacity,
                    child: Image.asset(
                      'assets/images/Dana-logo.png',
                      color: Colors.white,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Animasi Fade-in Text
                AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: _opacity,
                  child: Text(
                    "DANA App",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // Halaman utama
        '/': (context) => SplashScreen(),
        '/home': (context) => DanaHome(),
        '/aktivitas': (context) => WalletScreen(),
        '/minta': (context) => MintaUangPage(),
        '/kirim': (context) => KirimUangPage(),
        '/profile': (context) => DanaProfileScreen(),
        '/isiSaldo': (context) => IsiSaldoPage(),
      },
    );
  }
}

class DanaHome extends StatelessWidget {
  final PageController controller =
      PageController(viewportFraction: 0.85, initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/Dana-logo.png',
              width: 25,
              height: 25,
              color: Colors.white,
            ),
            Text(
              '  Rp 5.990 ',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Icon(MdiIcons.eyeOffOutline, color: Colors.white, size: 10),
            Spacer(),
            Icon(MdiIcons.emailOutline, color: Colors.white),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background color
          Positioned.fill(
            child: Container(
              color: Colors.blue,
            ),
          ),
          // Top icons
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTopIcon(MdiIcons.lineScan, 'Pindai'),
                  _buildTopIcon(MdiIcons.plusBoxOutline, 'Isi Saldo'),
                  _buildTopIcon(MdiIcons.send, 'Kirim'),
                  _buildTopIcon(Icons.request_page, 'Minta'),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 85, right: 10, left: 10),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius:
                    BorderRadius.circular(16), // Menambahkan radius pada sudut
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Row pertama
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/lazada.jpg',
                          width: 50,
                          height: 50,
                          fit: BoxFit
                              .cover, // Agar gambar memenuhi area lingkaran
                        ),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          mainAxisSize: MainAxisSize
                              .min, // Column hanya setinggi anak-anaknya
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('   Belanja Mulai 1Rb             '),
                            Text(
                              '    Mulai Rp.1.000',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.amber),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 0, 153, 255),
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          minimumSize:
                              Size(50, 36), // Lebar dan tinggi minimum tombol
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // Radius sudut tombol
                          ),
                        ),
                        child: Text('SERBU',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  SizedBox(height: 16), // Jarak antar Row
                  // Row kedua
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildIconcenter(
                          MdiIcons.cellphoneWireless, 'Pulsa & Data'),
                      _buildIconcenter(MdiIcons.handshake, 'DANA Deals'),
                      _buildIconcenter(FontAwesomeIcons.receipt, 'My Bill'),
                      _buildIconcenter(FontAwesomeIcons.gifts, 'A+ reward'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildIconcenter(
                            MdiIcons.emailPlusOutline, 'DANA\n Kaget'),
                        _buildIconcenter(
                            MdiIcons.contactlessPaymentCircleOutline,
                            'Uang\n Elektronik'),
                        _buildIconcenter(
                            MdiIcons.satelliteUplink, 'Internet & TV\n Kabel'),
                        _buildIconcenter(MdiIcons.dotsGrid, 'Lainnya'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 340, right: 10, left: 10),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius:
                    BorderRadius.circular(12), // Menambahkan radius pada sudut
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Row pertama
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/Dana-logo.png',
                          width: 25,
                          height: 25,
                          fit: BoxFit
                              .cover, // Agar gambar memenuhi area lingkaran
                        ),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          mainAxisSize: MainAxisSize
                              .min, // Column hanya setinggi anak-anaknya
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('   DANA'),
                                Icon(
                                  MdiIcons.checkDecagram,
                                  size: 15,
                                  color: Colors.blue,
                                ),
                                Text(
                                    ' berbagi kabar terbaru                           '),
                                Icon(MdiIcons.chevronRightCircleOutline),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/Dana-logo.png',
                          width: 25,
                          height: 25,
                          fit: BoxFit
                              .cover, // Agar gambar memenuhi area lingkaran
                        ),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          mainAxisSize: MainAxisSize
                              .min, // Column hanya setinggi anak-anaknya
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('   DANA'),
                                Icon(
                                  MdiIcons.checkDecagram,
                                  size: 15,
                                  color: Colors.blue,
                                ),
                                Text(
                                    ' berbagi kabar terbaru                           '),
                                Icon(MdiIcons.chevronRightCircleOutline),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/Dana-logo.png',
                          width: 25,
                          height: 25,
                          fit: BoxFit
                              .cover, // Agar gambar memenuhi area lingkaran
                        ),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Column(
                          mainAxisSize: MainAxisSize
                              .min, // Column hanya setinggi anak-anaknya
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('   DANA'),
                                Icon(
                                  MdiIcons.checkDecagram,
                                  size: 15,
                                  color: Colors.blue,
                                ),
                                Text(
                                    ' berbagi kabar terbaru                           '),
                                Icon(MdiIcons.chevronRightCircleOutline),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 150,
              margin: EdgeInsets.only(top: 455, right: 10, left: 10),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: PageView.builder(
                controller: controller,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 153, 167, 192),
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/image${index + 1}.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(
                  top:
                      595, // Mengurangi margin atas untuk visibilitas, sesuaikan jika perlu
                  right: 10,
                  left: 10),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Row pertama
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Gambar di sebelah kiri
                      Image.asset(
                        'assets/images/dana-protected.jpg',
                        width: 140,
                        height: 40,
                      ),
                      // Tombol dengan warna biru di dalam dan outline
                      Container(
                        width: 150, // Tentukan ukuran lebar kontainer tombol
                        height: 40, // Tentukan ukuran tinggi tombol
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(
                                255, 0, 153, 255), // Warna outline biru
                            width: 2, // Ketebalan garis outline
                          ),
                          borderRadius:
                              BorderRadius.circular(8), // Radius sudut tombol
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Teks di bagian biru (40%)
                            Container(
                              width:
                                  60, // Membatasi lebar 40% dari lebar tombol
                              color: Color.fromARGB(255, 0, 153,
                                  255), // Warna biru di dalam tombol
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    MdiIcons.shield,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  Text(
                                    ' 60%',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Teks di bagian transparan (60%)
                            Container(
                              width:
                                  80, // Membatasi lebar 60% dari lebar tombol
                              alignment: Alignment.center,
                              child: Text(
                                'LINDUNGI',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 350, // Lebar kotak
                        height: 50, // Tinggi kotak
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(
                                0.5), // Warna garis hitam dengan opacity 50%
                            width: 2, // Ketebalan garis
                          ),
                          borderRadius:
                              BorderRadius.circular(8), // Radius sudut kotak
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(MdiIcons.magnify),
                            Text(
                              'CS DANA menawarkan bantuan?',
                              style: TextStyle(
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(
                                    0.5), // Warna teks dengan opacity 50%
                                fontWeight: FontWeight.bold, // Teks tebal
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
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
              Navigator.pushReplacementNamed(
                  context, '/home'); // Navigasi ke halaman Beranda
              break;
            case 1:
              Navigator.pushReplacementNamed(
                  context, '/aktivitas'); // Navigasi ke halaman Aktivitas
              break;
            case 2:
              Navigator.pushReplacementNamed(
                  context, '/minta'); // Navigasi ke halaman Pay
              break;
            case 3:
              Navigator.pushReplacementNamed(
                  context, '/kirim'); // Navigasi ke halaman Dompet
              break;
            case 4:
              Navigator.pushReplacementNamed(
                  context, '/profile'); // Navigasi ke halaman Saya
              break;
            case 5:
              Navigator.pushReplacementNamed(
                  context, '/isiSaldo'); // Navigasi ke halaman Dompet
              break;
          }
        },
      ),
    );
  }

  Widget _buildIconcenter(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon,
            color: const Color.fromARGB(255, 0, 0, 0),
            size: 30), // Ganti dengan warna dan ukuran sesuai kebutuhan
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
          ), // Ganti dengan warna dan gaya teks sesuai kebutuhan
        ),
      ],
    );
  }


  Widget _buildTopIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
