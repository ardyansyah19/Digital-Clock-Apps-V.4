#  Jam Digital — Flutter App
By Ahmad Riko Dyansyah

Aplikasi **Jam Digital** dengan tampilan modern bergaya *neon gradient*,
lengkap dengan fitur **Kalender** (menyoroti tanggal hari ini secara
otomatis) dan **Alarm** yang benar-benar berfungsi lewat notifikasi lokal
Android/iOS — plus bonus fitur **Stopwatch**.

---

## ✨ Fitur

| Fitur | Deskripsi |
|---|---|
| **Jam Digital** | Jam real-time (update tiap detik), tanggal lengkap Bahasa Indonesia, sapaan otomatis (Pagi/Siang/Sore/Malam) sesuai jam saat ini. |
| **Kalender** | Tampilan bulan penuh, tanggal hari ini otomatis tersorot, bisa berpindah bulan/tahun, tambah & hapus agenda/catatan per tanggal (tersimpan lokal). |
| **Alarm** | Tambah, edit, hapus, aktif/nonaktifkan alarm. Mendukung alarm sekali jalan maupun berulang (pilih hari), label kustom, suara & getar bisa diatur, dan **tetap berbunyi walau aplikasi ditutup** (lewat notifikasi terjadwal). |
| **Stopwatch** *(bonus)* | Stopwatch dengan pencatatan lap time. |
| **Tema Gelap/Terang** | Bisa diganti langsung dari ikon di pojok kanan atas. |

---

## 🧱 Struktur Proyek

```
digital_clock_app/
├── lib/
│   ├── main.dart                     # Entry point aplikasi
│   ├── models/
│   │   └── alarm_model.dart          # Model data alarm
│   ├── services/
│   │   ├── alarm_service.dart        # CRUD + penjadwalan alarm
│   │   └── notification_service.dart # Wrapper flutter_local_notifications
│   ├── theme/
│   │   └── app_theme.dart            # Warna & tema light/dark
│   └── screens/
│       ├── home_screen.dart          # Bottom navigation utama
│       ├── clock_screen.dart         # Halaman jam digital
│       ├── calendar_screen.dart      # Halaman kalender
│       ├── alarm_screen.dart         # Halaman daftar & editor alarm
│       ├── alarm_ring_screen.dart    # Halaman saat alarm berbunyi
│       └── stopwatch_screen.dart     # Halaman stopwatch (bonus)
├── assets/sounds/                    # Taruh alarm_sound.mp3 di sini
├── android/AndroidManifest_ADDITIONS.md  # Panduan izin Android tambahan
└── pubspec.yaml
```

---

## 🚀 Cara Menjalankan

### 1. Prasyarat
- [Flutter SDK](https://docs.flutter.dev/get-started/install) sudah terpasang (`flutter doctor` tanpa error).
- Emulator Android/iOS aktif, atau perangkat fisik terhubung.

### 2. Setup Awal
Proyek ini dibuat berisi kode Dart lengkap (`lib/`), tetapi folder
platform native (`android/`, `ios/`, dll.) belum di-generate karena
dibuat di luar mesin Flutter. Jalankan sekali di root proyek:

```bash
flutter create .
```

Perintah ini **aman** — hanya akan mengisi folder platform yang belum ada
tanpa menimpa folder `lib/` yang sudah berisi kode aplikasi.

### 3. Tambahkan Izin Android
Buka file `android/AndroidManifest_ADDITIONS.md` dan ikuti instruksinya
untuk menambahkan permission alarm & notifikasi ke
`android/app/src/main/AndroidManifest.xml`.

### 4. Tambahkan Suara Alarm
Lihat `assets/sounds/README.txt` — cukup taruh file `alarm_sound.mp3`
di folder `assets/sounds/` (dan salin ke `android/app/src/main/res/raw/`
untuk notifikasi sistem Android).

### 5. Install Dependencies

```bash
flutter pub get
```

### 6. Jalankan Aplikasi

```bash
flutter run
```

---

## 📦 Dependencies Utama

| Package | Kegunaan |
|---|---|
| `intl` | Format tanggal & waktu Bahasa Indonesia |
| `table_calendar` | Widget kalender interaktif |
| `flutter_local_notifications` | Menjadwalkan & menampilkan alarm sebagai notifikasi |
| `timezone` + `flutter_timezone` | Penjadwalan alarm yang akurat sesuai zona waktu perangkat |
| `shared_preferences` | Menyimpan daftar alarm & agenda kalender secara lokal |
| `audioplayers` | Memutar suara saat layar alarm aktif |

---

## 🛠️ Catatan Pengembangan

- Alarm dijadwalkan menggunakan **exact alarm** (`AndroidScheduleMode.exactAllowWhileIdle`)
  agar tetap presisi walau HP dalam mode hemat baterai — pastikan izin
  *"Alarms & reminders"* diaktifkan secara manual di beberapa perangkat
  Android 12+ jika diminta sistem.
- Alarm berulang mingguan dijadwalkan per-hari menggunakan
  `matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime`, sehingga
  otomatis berulang tanpa perlu dijadwalkan ulang manual setiap minggu.
- Data alarm & agenda kalender disimpan secara **lokal** di perangkat
  (tidak ada server/backend) menggunakan `shared_preferences`.
- Fitur *snooze* pada `alarm_ring_screen.dart` saat ini menutup layar
  alarm; silakan kembangkan lebih lanjut untuk menjadwalkan ulang alarm
  +5 menit secara otomatis jika dibutuhkan.

---

## Lisensi

Proyek ini bebas digunakan, dimodifikasi, dan dikembangkan lebih lanjut
sesuai kebutuhanmu.
