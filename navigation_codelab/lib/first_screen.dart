// Import library Flutter dan file layar lainnya.
import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'third_screen.dart';

// Class untuk layar pertama (FirstScreen).
class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul "First Screen".
      appBar: AppBar(title: const Text('First Screen')),

      // Body layar berisi teks dan tombol navigasi.
      body: Center(
        child: Column(
          // Mengatur teks dan tombol berada di tengah.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Teks statis yang tampil di layar pertama.
            const Text('This is the First Screen'),

            // Tombol untuk navigasi ke layar kedua.
            ElevatedButton(
              onPressed: () {
                // Navigasi ke layar kedua menggunakan pushReplacement
                // untuk menggantikan layar saat ini dengan layar kedua.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Text('Go to Second Screen'),
            ),

            // Tombol untuk navigasi ke layar ketiga.
            ElevatedButton(
              onPressed: () {
                // Navigasi ke layar ketiga menggunakan pushReplacement
                // untuk menggantikan layar saat ini dengan layar ketiga.
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

      // Menambahkan BottomNavigationBar di layar pertama.
      bottomNavigationBar: buildBottomNavBar(context, 0), // Bottom Navbar
    );
  }
}

// Widget untuk membuat BottomNavigationBar yang konsisten di semua layar.
Widget buildBottomNavBar(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    // Index saat ini menandai item yang sedang aktif.
    currentIndex: currentIndex,
    onTap: (index) {
      // Navigasi ke layar yang sesuai berdasarkan item yang diklik.
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

    // Item-item di dalam BottomNavigationBar.
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
