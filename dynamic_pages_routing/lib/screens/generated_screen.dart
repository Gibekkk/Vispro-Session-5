import 'package:flutter/material.dart'; // Mengimpor library Flutter untuk menggunakan widget material

class GeneratedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil nomor layar yang dikirimkan dari DynamicScreen melalui argument
    final int? screenNumber = ModalRoute.of(context)?.settings.arguments as int?;

    // Jika nomor layar tidak valid (null), tampilkan layar error
    if (screenNumber == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')), // Judul app bar error
        body: Center(
          child: Text('Layar invalid!'), // Pesan error jika layar tidak valid
        ),
      );
    }

    // Jika nomor layar valid, tampilkan layar dengan nomor tersebut
    return Scaffold(
      appBar: AppBar(
        title: Text('Layar $screenNumber'), // Judul app bar dengan nomor layar
      ),
      body: Center(
        child: Text('Ini layar $screenNumber.'), // Tampilkan teks yang menunjukkan nomor layar
      ),
    );
  }
}
