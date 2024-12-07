import 'package:flutter/material.dart';
import 'screens/screen1.dart';
import 'screens/screen2.dart';
import 'screens/screen3.dart';
import 'screens/dynamic_screen.dart';
import 'screens/generated_screen.dart';
import 'screens/error_screen.dart';
import 'dart:async'; // Import untuk handle error asinkron di Zone

// GlobalKey untuk Navigator, digunakan agar bisa diakses di global error handler
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  // Global Error Handling
  // Menangkap error yang terjadi dalam widget tree
  FlutterError.onError = (FlutterErrorDetails details) {
    // Menampilkan error di console
    FlutterError.dumpErrorToConsole(details);

    // Redirect ke Error Screen dengan pesan error
    _redirectToErrorScreen(details.exceptionAsString());
  };

  // Membungkus aplikasi dalam Zone untuk menangkap error asinkron
  runZonedGuarded(() {
    // Menjalankan aplikasi
    runApp(MyApp());
  }, (error, stackTrace) {
    // Menangkap error yang terjadi pada operasi async (Future/Stream)
    _redirectToErrorScreen(error.toString());
  });
}

// Fungsi untuk mengarahkan ke Error Screen dengan pesan error
void _redirectToErrorScreen(String errorMessage) {
  // Menambahkan callback setelah widget frame selesai
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // Mengarahkan user ke Error Screen dan menghapus semua route di stack
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/error_screen', // Route ke Error Screen
      (route) => false, // Pop semua route sebelumnya
      arguments: errorMessage, // Mengirimkan pesan error ke Error Screen
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // Menetapkan global navigator untuk aplikasi
      title: 'Dynamic Screens Demo',
      initialRoute: '/screen1', // Route pertama yang akan dibuka
      routes: {
        // Definisi rute untuk aplikasi
        '/screen1': (context) => Screen1(), // Route untuk Screen 1
        '/screen2': (context) => Screen2(), // Route untuk Screen 2
        '/screen3': (context) => Screen3(), // Route untuk Screen 3
        '/dynamic_screen': (context) => DynamicScreen(), // Route untuk layar dinamis
        '/generated_screen': (context) => GeneratedScreen(), // Route untuk layar yang dihasilkan
        '/error_screen': (context) => ErrorScreen(), // Route untuk Error Screen
      },
    );
  }
}
