import 'package:flutter/material.dart'; // Mengimpor library Flutter untuk menggunakan widget material

class DynamicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil jumlah layar yang dikirimkan dari layar sebelumnya
    final int? totalScreens =
        ModalRoute.of(context)?.settings.arguments as int?;

    // Jika jumlah layar tidak valid atau kurang dari 1, tampilkan error
    if (totalScreens == null || totalScreens <= 0) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')), // Judul app bar error
        body: Center(
          child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Menyusun widget secara vertikal
              children: [
                Text('Tidak ada layar yang terdaftar untuk digenerate!'),
                ElevatedButton(
                  onPressed: () {
                    // Mengarahkan pengguna kembali ke Screen 1 dan menghapus semua layar sebelumnya
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/screen1', // Nama route yang menuju ke Screen 1
                      (route) =>
                          false, // Menghapus semua route sebelumnya dari stack
                    );
                  },
                  child: Text('Kembali ke Screen 1'), // Teks tombol
                ),
              ]),
        ),
      );
    }

    // Jika jumlah layar valid, tampilkan dynamic screen dengan daftar layar
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Screen'), // Judul app bar
      ),
      body: ListView.builder(
        itemCount:
            totalScreens, // Menentukan jumlah item berdasarkan totalScreens
        itemBuilder: (context, index) {
          final screenNumber = index + 1; // Menentukan nomor layar
          return ListTile(
            title: Text('Layar $screenNumber'), // Menampilkan teks "Layar X"
            onTap: () {
              // Navigasi ke generated screen ketika item ditekan
              Navigator.pushNamed(
                context,
                '/generated_screen', // Arahkan ke generated_screen
                arguments: {'screenNumber': screenNumber, 'totalScreens': totalScreens}, // Kirim nomor layar dan jumlah layar sebagai argument
              );
            },
          );
        },
      ),
    );
  }
}
