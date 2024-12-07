import 'package:flutter/material.dart'; // Mengimpor library Flutter untuk menggunakan widget material

class BottomNavBar extends StatelessWidget {
  // Deklarasi variabel untuk menyimpan index layar aktif dan layar asal sebelumnya
  final int currentIndex;
  final String fromScreen;

  // Konstruktor untuk menerima currentIndex dan fromScreen
  const BottomNavBar(
      {Key? key, required this.currentIndex, required this.fromScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menampilkan BottomNavigationBar dengan 3 tab yang mewakili layar 1, 2, dan 3
    return BottomNavigationBar(
      // Menentukan index tab yang aktif berdasarkan currentIndex yang diterima
      currentIndex: currentIndex,
      // Menangani perubahan tab dengan onTap
      onTap: (index) {
        // Berdasarkan index yang dipilih, arahkan ke layar yang sesuai
        switch (index) {
          case 0: // Ketika tab pertama dipilih, navigasi ke screen 1
            Navigator.pushNamed(context, '/screen1', arguments: fromScreen);
            break;
          case 1: // Ketika tab kedua dipilih, navigasi ke screen 2
            Navigator.pushNamed(context, '/screen2', arguments: fromScreen);
            break;
          case 2: // Ketika tab ketiga dipilih, navigasi ke screen 3
            Navigator.pushNamed(context, '/screen3', arguments: fromScreen);
            break;
        }
      },
      items: [
        // Item pertama untuk navigasi ke layar pertama (screen1)
        BottomNavigationBarItem(
          icon: Icon(Icons.looks_one), // Ikon angka 1
          label: 'First', // Label untuk tab pertama
        ),
        // Item kedua untuk navigasi ke layar kedua (screen2)
        BottomNavigationBarItem(
          icon: Icon(Icons.looks_two), // Ikon angka 2
          label: 'Second', // Label untuk tab kedua
        ),
        // Item ketiga untuk navigasi ke layar ketiga (screen3)
        BottomNavigationBarItem(
          icon: Icon(Icons.looks_3), // Ikon angka 3
          label: 'Third', // Label untuk tab ketiga
        ),
      ],
    );
  }
}
