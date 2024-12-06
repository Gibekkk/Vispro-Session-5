// Import library Flutter dan file layar lainnya.
import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'third_screen.dart';

// Class untuk layar kedua (SecondScreen).
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul "Second Screen".
      appBar: AppBar(title: const Text('Second Screen')),

      // Body layar berisi teks dan tombol navigasi.
      body: Center(
        child: Column(
          // Mengatur teks dan tombol berada di tengah.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Teks statis yang tampil di layar kedua.
            const Text('This is the Second Screen'),

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

            // Tombol untuk navigasi ke layar ketiga.
            ElevatedButton(
              onPressed: () {
                // Navigasi ke layar ketiga menggunakan pushReplacement,
                // menggantikan layar saat ini dengan layar ketiga.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
              },
              child: Text('Go to Third Screen'),
            ),
          ],
        ),
      ),

      // Menambahkan BottomNavigationBar di layar kedua.
      bottomNavigationBar: buildBottomNavBar(context, 1), // Bottom Navbar
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

    // Daftar item di dalam BottomNavigationBar.
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
