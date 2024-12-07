import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart'; // Mengimpor BottomNavBar untuk navigasi

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State(); // Membuat state untuk Screen1
}

class _Screen1State extends State<Screen1> {
  final TextEditingController _controller = TextEditingController(); // Controller untuk inputan pengguna
  final int maxScreens = 300; // Batas maksimal jumlah layar yang bisa digenerate

  // Fungsi untuk generate layar berdasarkan inputan
  void _generateScreens() {
    final input = int.tryParse(_controller.text); // Mengambil inputan dan mencoba mengubahnya jadi integer
    if (input != null && input > 0) {
      if (input > maxScreens) {
        // Jika jumlah layar yang diminta melebihi batas
        Navigator.pushNamed(
          context,
          '/error_screen', // Navigasi ke Error Screen
          arguments: 'Jumlah layar melewati batas! Max layar adalah $maxScreens.', // Menampilkan pesan error
        );
      } else {
        // Jika input valid dan dalam batas yang diterima
        Navigator.pushNamed(
          context,
          '/dynamic_screen', // Navigasi ke Dynamic Screen
          arguments: input, // Mengirim jumlah layar yang diminta ke Dynamic Screen
        );
      }
    } else {
      // Jika inputan tidak valid (misalnya bukan angka)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Angka tidak valid!')), // Menampilkan snackbar dengan pesan error
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mengambil argumen yang dipassing dari layar sebelumnya
    final String? fromScreen = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: Text('Screen 1')), // AppBar dengan judul "Screen 1"
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Menyusun widget secara vertikal di tengah
          children: [
            // Menampilkan pesan yang berbeda berdasarkan dari layar mana pengguna datang
            Text(fromScreen == null
                ? 'Ini layar 1. Screen pertama yang kamu buka!'
                : 'Ini layar 1. Kamu datang dari $fromScreen.'),
            SizedBox(height: 20), // Memberikan jarak antara teks dan input
            TextField(
              controller: _controller, // Menghubungkan TextField dengan controller
              keyboardType: TextInputType.number, // Mengatur keyboard untuk input angka
              decoration: InputDecoration(
                labelText: 'Masukkan jumlah layar. Max $maxScreens', // Memberi label dan batas input
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // Memberikan jarak antara TextField dan tombol
            ElevatedButton(
              onPressed: _generateScreens, // Menjalankan fungsi _generateScreens saat tombol ditekan
              child: Text('Generate Layar'), // Teks pada tombol
            ),
          ],
        ),
      ),
      // Menambahkan BottomNavBar untuk navigasi antar layar
      bottomNavigationBar: BottomNavBar(currentIndex: 0, fromScreen: 'Screen 1'),
    );
  }
}
