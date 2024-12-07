# dynamic_pages_routing

Proyek ini bertujuan untuk mempelajari penerapan **routing dinamis** pada Flutter, termasuk menangani navigasi dengan tombol, bottom navigation bar, serta skenario error handling global.

## Cara Install dan Pakai

### Prasyarat
- Pastikan Anda telah menginstal **Flutter SDK** pada komputer Anda.
- Pastikan Anda memiliki editor kode seperti **Android Studio** atau **Visual Studio Code**.
- Siapkan perangkat fisik (Android/iOS) atau emulator untuk menjalankan aplikasi.

### Instalasi Aplikasi
1. Clone repositori proyek ini:
`
git clone --single-branch --branch navigation-assignments https://github.com/Gibekkk/Vispro-Session-5.git
`
2. Masuk ke direktori proyek:
`
cd Path-To-Download-Folder/Vispro-Session-5/dynamic_pages_routing
`
3. Jalankan perintah untuk mendapatkan semua dependensi:
`
flutter pub get
`

### Cara Menjalankan Aplikasi
1. Sambungkan perangkat fisik Anda atau siapkan emulator. Anda juga dapat menjalankan aplikasi melalui web browser.
2. Jalankan perintah berikut untuk menjalankan aplikasi:
`
cd Path-To-Download-Folder/Vispro-Session-5/dynamic_pages_routing
flutter run
`
3. Pilih device yang ingin digunakan untuk menjalankan aplikasi.

## Cara Penggunaan Aplikasi
- **Masukkan jumlah layar dinamis**: Pada layar pertama, masukkan angka untuk menentukan jumlah layar dinamis yang akan dibuat, kemudian tekan tombol **Generate Layar**.  
- Jika jumlah layar yang dimasukkan terlalu besar dan menyebabkan crash, aplikasi akan menampilkan layar error dengan pesan yang relevan.
- **Navigasi layar**:
- Setiap layar yang dihasilkan menampilkan pesan "Ini layar X", di mana X adalah nomor layar.
- Anda dapat kembali ke layar awal (Screen 1) menggunakan tombol "Kembali ke Home" di layar dinamis.
- **Bottom Navigation Bar**:
- Bottom navigation bar tersedia di semua layar statis (Screen 1, Screen 2, dan Screen 3) untuk navigasi antar layar.
- Setiap tombol memiliki ikon unik yang mencerminkan layar yang akan dituju.

## Pendekatan
Untuk mengembangkan aplikasi ini, pendekatan yang dilakukan adalah sebagai berikut:
1. **Routing Dinamis**: Menggunakan `Navigator` dengan `named routes` untuk membuat jalur navigasi antar layar, baik layar statis maupun layar dinamis.
2. **Global Error Handling**:
- Menggunakan `FlutterError.onError` untuk menangani error pada widget tree.
- Menggunakan `runZonedGuarded` untuk menangani error asinkron, seperti yang berasal dari operasi Future atau Stream.
- Jika terjadi error, aplikasi akan menampilkan layar error secara otomatis tanpa crash.
3. **Reusable Components**: Mengimplementasikan widget yang dapat digunakan kembali, seperti bottom navigation bar.

## Tantangan
- **Handling Layar Dinamis**: Tantangan utama adalah menangani jumlah layar dinamis yang terlalu besar sehingga dapat menyebabkan memori penuh. Hal ini diatasi dengan menambahkan global error handling untuk mendeteksi dan menangani crash secara langsung.
- **Error Handling Global**: Menyediakan skenario fallback untuk setiap error yang tidak terduga dengan mengarahkan user ke layar error.
- **Optimasi Navigasi**: Mengurangi penumpukan stack navigasi menggunakan `pushReplacement` untuk navigasi layar dinamis agar lebih hemat memori.

## Fitur Utama
1. **Pembuatan Layar Dinamis**:
- User dapat menentukan jumlah layar dinamis yang ingin dibuat.
- Setiap layar dinamis memiliki pesan unik dan tombol navigasi kembali ke layar awal.
2. **Bottom Navigation Bar**:
- Navigasi antar layar statis menggunakan bar navigasi yang terdapat di bagian bawah layar.
- Ikon pada navbar disesuaikan untuk mencerminkan layar tujuan.
3. **Global Error Handling**:
- Jika aplikasi mengalami crash, layar error akan ditampilkan dengan pesan spesifik untuk membantu debugging.
4. **Input Validasi**:
- Input pada layar pertama divalidasi untuk mencegah crash akibat input yang tidak valid.

