import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IsiSaldoPage(),
    );
  }
}

class IsiSaldoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isi Saldo DANA'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SectionTitle(title: 'Mau isi saldo DANA kamu dengan cara apa?'),
          SizedBox(height: 20),
          SectionTitle(title: 'Kartu Pembayaran Saya'),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 2,
            child: ListTile(
              leading: Icon(Icons.add, color: Colors.blue, size: 30.0),
              title: Text('Kartu Baru'),
              subtitle: Row(
                children: [
                  Image.asset('assets/images/visa_logo.png', height: 40),
                  SizedBox(width: 5),
                  Image.asset('assets/images/mastercard_logo.png', height: 40),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 24),
              onTap: () {},
            ),
          ),
          SizedBox(height: 20),
          SectionTitle(title: 'Bank'),
          _buildBankListTile(
              context, 'BRI', 'assets/images/bri_logo.png', () {}),
          _buildBankListTile(
              context, 'CIMB Niaga', 'assets/images/cimb_logo.png', () {}),
          _buildBankListTile(
              context, 'BCA', 'assets/images/bca_logo.png', () {}),
          TextButton(
            onPressed: () {},
            child: Text('Tampilkan semua bank'),
          ),
          Divider(),
          SectionTitle(title: 'Uang Tunai'),
          ListTile(
            title: Text('Lokasi Isi Saldo'),
            subtitle: Text('Cari di sekitarmu yuk!'),
            trailing: TextButton(
              onPressed: () {},
              child: Text('BUKA PETA'),
            ),
          ),
          _buildCashLocationTile(
              context, 'Indomaret', 'assets/images/indomaret_logo.png'),
          _buildCashLocationTileWithExtraTitles(
              context, 'Alfamart', ['Alfamidi', 'Dan+Dan'],
              'assets/images/alfamart_logo.png'),
          _buildCashLocationTile(
              context, 'Lawson', 'assets/images/lawson_logo.png'),
          TextButton(
            onPressed: () {},
            child: Text('Cek tempat lain'),
          ),
          Divider(),
          SectionTitle(title: 'Lainnya'),
          ListTile(
            title: Text('OneKlik'),
            subtitle: Text('Kartu Debit BCA'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBankListTile(
      BuildContext context, String title, String assetPath, VoidCallback onTap) {
    return ListTile(
      leading: Image.asset(assetPath, width: 40),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 24),
      onTap: onTap,
    );
  }

  Widget _buildCashLocationTile(
      BuildContext context, String title, String assetPath) {
    return ListTile(
      leading: Image.asset(assetPath, width: 40),
      title: Text(title),
      onTap: () {},
    );
  }

  Widget _buildCashLocationTileWithExtraTitles(
      BuildContext context, String title, List<String> extraTitles, String assetPath) {
    return ListTile(
      leading: Image.asset(assetPath, width: 40),
      title: Row(
        children: [
          Text(title),
          for (var extraTitle in extraTitles) ...[
            SizedBox(width: 8),
            Text(extraTitle),
          ],
        ],
      ),
      onTap: () {},
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
