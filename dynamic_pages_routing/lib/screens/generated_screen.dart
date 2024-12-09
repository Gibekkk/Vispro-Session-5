import 'package:flutter/material.dart';

class GeneratedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ambil arguments sebagai Map<String, dynamic>
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final int? screenNumber = arguments?['screenNumber'] as int?;
    final int? totalScreens = arguments?['totalScreens'] as int?;

    // Handle kasus invalid
    if (screenNumber == null || totalScreens == null || screenNumber <= 0 || totalScreens <= 0) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Layar invalid!'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/screen1',
                    (route) => false,
                  );
                },
                child: Text('Kembali ke Screen 1'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Layar $screenNumber'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/screen1',
              (route) => false,
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ini layar $screenNumber.', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol Previous: Hilang kalau di layar pertama
                if (screenNumber > 1)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/generated_screen',
                        arguments: {'screenNumber': screenNumber - 1, 'totalScreens': totalScreens},
                      );
                    },
                    child: Text('Previous'),
                  ),
                if (screenNumber > 1) SizedBox(width: 20), // Jarak antar tombol

                // Tombol Next: Hilang kalau di layar terakhir
                if (screenNumber < totalScreens)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/generated_screen',
                        arguments: {'screenNumber': screenNumber + 1, 'totalScreens': totalScreens},
                      );
                    },
                    child: Text('Next'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
