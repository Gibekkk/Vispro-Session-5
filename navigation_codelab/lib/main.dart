// Import package Flutter dan file lain yang berisi screen (layar) aplikasi.
import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';

// Fungsi utama untuk menjalankan aplikasi Flutter.
void main() => runApp(MyApp());

// Class utama aplikasi Flutter.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Judul aplikasi yang akan muncul di beberapa platform (misalnya saat minimize aplikasi).
      title: 'Navigation Codelab',

      // Tema utama aplikasi, menggunakan warna biru sebagai warna utama.
      theme: ThemeData(primarySwatch: Colors.blue),

      // Halaman awal aplikasi yang akan ditampilkan pertama kali saat aplikasi dijalankan.
      home: FirstScreen(),

      // Daftar rute yang digunakan untuk navigasi antar layar.
      // '/first' untuk FirstScreen, '/second' untuk SecondScreen, '/third' untuk ThirdScreen.
      routes: {
        '/first': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
      },
    );
  }
}
