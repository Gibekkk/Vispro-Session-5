import 'package:flutter/material.dart';

class DynamicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int? totalScreens =
        ModalRoute.of(context)?.settings.arguments as int?;

    if (totalScreens == null || totalScreens <= 0) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
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

    return WillPopScope(
      onWillPop: () async {
        // Mengizinkan tombol back device untuk mempop satu layar
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dynamic Screen'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Back button di AppBar langsung kembali ke Screen 1
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/screen1',
                (route) => false,
              );
            },
          ),
        ),
        body: ListView.builder(
          itemCount: totalScreens,
          itemBuilder: (context, index) {
            final screenNumber = index + 1;
            return ListTile(
              title: Text('Layar $screenNumber'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/generated_screen',
                  arguments: screenNumber,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
