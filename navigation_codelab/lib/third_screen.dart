// Import library Flutter dan file layar lainnya.
import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';

// Class untuk layar ketiga (ThirdScreen).
class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul "Third Screen".
      appBar: AppBar(title: const Text('Third Screen')),

      // Body layar berisi teks dan tombol navigasi.
      body: Center(
        child: Column(
          // Mengatur teks dan tombol berada di tengah layar.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Teks statis yang menunjukkan ini adalah layar ketiga.
            const Text('This is the Third Screen'),

            // Tombol untuk navigasi ke layar pertama.
            ElevatedButton(
              onPressed: () {
                // Navigasi ke layar pertama menggunakan pushReplacement,
                // menggantikan layar saat ini dengan layar pertama.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FirstScreen()),
                );
              },
              child: Text('Go to First Screen'),
            ),

            // Tombol untuk navigasi ke layar kedua.
            ElevatedButton(
              onPressed: () {
                // Navigasi ke layar kedua menggunakan pushReplacement,
                // menggantikan layar saat ini dengan layar kedua.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Text('Go to Second Screen'),
            ),
          ],
        ),
      ),

      // Menambahkan BottomNavigationBar di layar ketiga.
      bottomNavigationBar: buildBottomNavBar(context, 2), // Bottom Navbar
    );
  }
}

// Widget untuk membuat BottomNavigationBar yang konsisten di semua layar.
Widget buildBottomNavBar(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    // Index saat ini menandai item yang sedang aktif.
    currentIndex: currentIndex,

    // Ketika salah satu item di-tap, lakukan navigasi ke layar yang sesuai.
    onTap: (index) {
      switch (index) {
        case 0:
          // Navigasi ke FirstScreen.
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => FirstScreen()),
          );
          break;
        case 1:
          // Navigasi ke SecondScreen.
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SecondScreen()),
          );
          break;
        case 2:
          // Navigasi ke ThirdScreen.
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ThirdScreen()),
          );
          break;
      }
    },

    // Daftar item dalam BottomNavigationBar.
    items: const [
      // Item untuk FirstScreen.
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'First',
      ),
      // Item untuk SecondScreen.
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Second',
      ),
      // Item untuk ThirdScreen.
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'Third',
      ),
    ],
  );
}
