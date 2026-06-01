# Bali Urip Transport

**Bali Urip Transport** adalah aplikasi mobile berbasis Flutter yang dibuat untuk layanan **private driver** dan **flexible tour** di Bali. Aplikasi ini membantu pengguna melihat informasi layanan, destinasi wisata, profil driver, melakukan booking, serta menyimpan riwayat booking secara lokal.

Project ini dibuat sebagai project UTS mata kuliah Pemrograman Bergerak dengan menerapkan modul utama seperti **struktur folder, navigation bar, form, CRUD, dan SQLite**. Selain itu, project ini juga menambahkan beberapa fitur pengembangan seperti integrasi WhatsApp, upload foto profil, video hero, welcome popup, dan driver showcase.

## Deskripsi Project

Bali Urip Transport merupakan aplikasi yang ditujukan untuk wisatawan lokal maupun mancanegara yang membutuhkan layanan private driver di Bali. Konsep aplikasi ini bukan seperti aplikasi transportasi umum, tetapi lebih fokus pada layanan private driver dan tour fleksibel.

Pengguna dapat melihat destinasi populer, mengenal driver, mengisi form booking, dan melanjutkan komunikasi melalui WhatsApp. Data booking juga disimpan ke dalam riwayat agar dapat dilihat kembali oleh pengguna.

## Fitur Utama

* Login dan register user menggunakan SQLite
* Session user menggunakan Hive
* Home page dengan hero video
* Destination list dan detail destinasi
* Booking form
* Integrasi WhatsApp otomatis
* Booking history
* Delete booking dengan konfirmasi
* Profile user
* Edit profile dengan mode read-only dan edit
* Upload foto profil dari galeri
* Driver showcase
* Driver detail
* About page
* Splash screen
* Welcome popup

## Modul Wajib yang Diterapkan

### 1. Struktur Folder

Project dibuat dengan struktur folder yang dipisahkan berdasarkan fungsi masing-masing file.

```text
lib/
├── data/
├── database/
├── models/
├── screens/
├── utils/
├── widgets/
└── main.dart
```

### 2. Navigation Bar

Aplikasi menggunakan `BottomNavigationBar` untuk berpindah antar halaman utama, yaitu:

* Home
* Destinations
* History
* About
* Driver

Navigation bar menggunakan `IndexedStack` agar halaman tidak langsung reset ketika berpindah tab.

### 3. Form

Form utama terdapat pada halaman Booking. Form digunakan untuk menerima input data pengguna seperti:

* Nama
* Nomor WhatsApp
* Negara
* Bahasa
* Jumlah orang
* Lokasi penjemputan
* Preferensi destinasi
* Catatan tambahan

### 4. CRUD

CRUD diterapkan pada beberapa bagian aplikasi:

* Create: membuat data booking dari form booking
* Read: menampilkan data booking pada halaman Booking History
* Update: memperbarui data profile user
* Delete: menghapus data booking dengan konfirmasi

### 5. SQLite

SQLite digunakan untuk menyimpan data akun user, seperti:

* Email
* Username
* Password

SQLite digunakan pada fitur register, login, pengecekan email terdaftar, validasi password, dan update username.

## Fitur Pengembangan

### Integrasi WhatsApp

Setelah pengguna mengisi form booking, aplikasi akan membuka WhatsApp dengan pesan otomatis yang berisi data booking. Fitur ini menggunakan package `url_launcher`.

### Upload Foto Profil

Pengguna dapat memilih foto profil dari galeri. Path foto disimpan secara lokal dan ditampilkan kembali pada halaman profile serta icon profile di halaman Home. Fitur ini menggunakan package `image_picker`.

### Video Hero

Halaman Home menggunakan video hero agar tampilan lebih menarik dan sesuai dengan tema pariwisata Bali. Fitur ini menggunakan package `video_player`.

### Welcome Popup

Saat masuk ke halaman Home, aplikasi menampilkan popup sambutan yang berisi informasi singkat mengenai Bali Urip Transport.

### Driver Showcase

Aplikasi menyediakan halaman driver untuk menampilkan daftar driver, pengalaman, bahasa yang dikuasai, dan spesialisasi perjalanan.

## Package yang Digunakan

Beberapa package yang digunakan dalam project ini:

```yaml
sqflite
path
hive
hive_flutter
url_launcher
image_picker
video_player
intl
device_frame
flutter_launcher_icons
```

## Cara Menjalankan Project

Clone repository:

```bash
git clone https://github.com/Febri-html/Bali-Urip-Transport.git
```

Masuk ke folder project:

```bash
cd Bali-Urip-Transport
```

Install dependency:

```bash
flutter pub get
```

Jalankan aplikasi:

```bash
flutter run
```

## Catatan

Pastikan perangkat sudah memiliki Flutter SDK dan Android Studio atau device Android yang terhubung. Jika menggunakan emulator, pastikan emulator sudah berjalan sebelum menjalankan perintah `flutter run`.

## Struktur Database SQLite

Tabel yang digunakan untuk akun user:

```text
users
├── id INTEGER PRIMARY KEY AUTOINCREMENT
├── email TEXT NOT NULL UNIQUE
├── username TEXT NOT NULL
└── password TEXT NOT NULL
```

## Tema Aplikasi

Aplikasi menggunakan tema warna yang menyesuaikan identitas Bali Urip Transport:

* Primary: Teal
* Accent: Orange
* Background: Soft light teal

Tema ini dipilih agar aplikasi terasa modern, bersih, dan sesuai dengan konsep travel di Bali.

## Status Project

Project ini dibuat sebagai prototype aplikasi mobile untuk kebutuhan UTS. Aplikasi sudah dapat berjalan secara lokal dengan fitur login, register, booking, history, profile, dan integrasi WhatsApp.

## Developer

**Febrian Maulana**
Project: Bali Urip Transport
Framework: Flutter
