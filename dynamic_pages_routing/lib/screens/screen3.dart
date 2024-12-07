import 'package:flutter/material.dart'; // Mengimpor library Flutter untuk menggunakan widget material
import '../widgets/bottom_nav_bar.dart'; // Mengimpor widget BottomNavBar yang ada di folder widgets

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil data dari screen sebelumnya jika ada
    final String? fromScreen = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: Text('Screen 3')), // Menampilkan AppBar dengan judul "Screen 3"
      body: Center(
        // Menampilkan pesan berbeda tergantung apakah screen sebelumnya ada atau tidak
        child: Text(fromScreen == null 
          ? 'Ini layar 3. Screen pertama yang kamu buka!' // Jika tidak ada screen sebelumnya
          : 'Ini layar 3. Kamu datang dari $fromScreen.'), // Jika ada screen sebelumnya, tampilkan nama screen sebelumnya
      ),
      // Menambahkan BottomNavigationBar untuk navigasi antar screen
      bottomNavigationBar: BottomNavBar(currentIndex: 2, fromScreen: 'Screen 3'),
    );
  }
}
