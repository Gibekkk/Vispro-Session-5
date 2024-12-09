import 'package:flutter/material.dart';

class GeneratedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int? screenNumber =
        ModalRoute.of(context)?.settings.arguments as int?;

    if (screenNumber == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
          child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Menyusun widget secara vertikal
              children: [
                Text('Layar invalid!'),
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
          title: Text('Layar $screenNumber'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Back button di AppBar langsung kembali ke Screen 1
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/screen1',
                (route) => false, // Pop semua layar
              );
            },
          ),
        ),
        body: Center(
          child: Text('Ini layar $screenNumber.'),
        ),
      ),
    );
  }
}
