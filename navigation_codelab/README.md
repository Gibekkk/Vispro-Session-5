# navigation_codelab
Codelab ini bertujuan untuk mempelajari routing secara sederhana pada Flutter menggunakan tombol dan navigation bar.

## Cara Install dan Pakai

### Prasyarat
- Pastikan Anda telah menginstal Flutter SDK di komputer Anda.
- Pastikan Anda memiliki editor kode seperti Android Studio atau Visual Studio Code.
- Pastikan Anda memiliki device atau platform untuk menjalankan aplikasi.

### Instalasi Aplikasi
```
git clone https://github.com/Gibekkk/Vispro-Session-5.git
cd Path-To-Download-Folder/Vispro-Session-5/navigation_codelab
flutter pub get
```
   

### Cara Menjalankan Aplikasi
1. Hubungkan perangkat Android atau iOS Anda, atau siapkan emulator. Dapat juga dijalankan melalui web browser.
```
cd Path-To-Download-Folder/Vispro-Session-5/navigation_codelab
flutter run
```
2. jalankan code di atas, lalu pilih device untuk menjalankan aplikasi sesuai yang sudah disediakan

## Cara penggunaan aplikasi
- Pada screen pertama, klik tombol ```Go to Second Screen``` untuk ke screen ke dua atau klik tombol ```Go to Second Screen``` untuk ke screen ke tiga.
- Pada screen ke dua, klik tombol ```Go to Second Screen``` untuk ke screen pertama atau klik tombol ```Go to Second Screen``` untuk ke screen ke tiga.
- Pada screen ke tiga, klik tombol ```Go to Second Screen``` untuk ke screen pertama atau klik tombol ```Go to Second Screen``` untuk ke screen ke dua.
- Pada ketiga screen, terdapat navbar di bagian bawah layar yang bisa dipakai untuk berpindah ke screen manapun. Tombol first untuk ke first screen, tombol second untuk ke second screen, dan tombol third untuk ke third screen.

## Approach
Untuk mengerjakan tugas ini, saya mengikuti arahan di E-Learn UC untuk membuat dasar pada aplikasi di ```main.dart```, ```first_screen.dart```, ```second_screen.dart```. Lalu, saya melanjutkan ke step berikutnya dengan membuat layar ke tiga dan menambahkan kode untuk membuat navigation bar beserta navigation ke layar ke tiga.

## Challenges
Untuk proyek kali ini, tantangan yang saya hadapi adalah pembuatan navigation bar dan routing button yang menambah stack pada aplikasi dan memakan memori, jadi saya menggunakan routing yang tidak menambah stack dengan menggunakan `pushReplacement` pada Flutter.
Saya juga mengalami sedikit tantangan dalam menentukan routing pada aplikasi, namun setelah beberapa perobaan saya berhasil membuat `main.dart` menjadi routing pada aplikasi saya

## Fitur utama
- Tombol perpindahan screen : di setiap screen, ada dua tombol. Untuk screen pertama ada tombol untuk ke screen kedua dan ke screen ketiga. Untuk screen kedua, ada tombol untuk kembali ke screen pertama dan tombol untuk lanjut ke screen ketiga. Untuk screen ketiga, ada tombol untuk kembali ke screen pertama dan tombol untuk kembali ke screen kedua.
- Navigation Bar : di setiap screen, terdapat navigation bar yang dapat digunakan untuk berpindah ke screen manapun dalam aplikasi.
- Navbar : di setiap screen ada navbar di bagian bawah screen. Penggunaan navbar adalah untuk pindah screen sama seperti tombol yang ada pada screen.
