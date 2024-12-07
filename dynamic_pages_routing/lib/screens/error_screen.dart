import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil pesan error yang dipassing dari argument ketika navigasi ke error screen
    final String? errorMessage = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      // AppBar untuk menampilkan judul pada layar
      appBar: AppBar(
        title: Text('Oops! Terjadi Error!'), // Judul pada AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Menyusun widget secara vertikal
          children: [
            // Menampilkan teks utama yang memberi tahu aplikasi crash
            Text(
              'Aplikasi Crash!', 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Penataan teks dengan ukuran dan bobot
            ),
            SizedBox(height: 20), // Memberi jarak antara widget
            // Menampilkan pesan error yang diterima, jika tidak ada pesan maka menampilkan teks default
            Text(
              errorMessage ?? 'Error Tidak Dikenal. Coba periksa kode program!',
              textAlign: TextAlign.center, // Menyusun teks agar rata tengah
              style: TextStyle(fontSize: 16), // Penataan ukuran font
            ),
            SizedBox(height: 30), // Memberikan jarak antara teks dan tombol
            // Tombol untuk mengarahkan kembali ke Screen 1
            ElevatedButton(
              onPressed: () {
                // Mengarahkan pengguna kembali ke Screen 1 dan menghapus semua layar sebelumnya
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/screen1', // Nama route yang menuju ke Screen 1
                  (route) => false, // Menghapus semua route sebelumnya dari stack
                );
              },
              child: Text('Kembali ke Screen 1'), // Teks tombol
            ),
          ],
        ),
      ),
    );
  }
}
