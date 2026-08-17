# Tambahan wajib di `android/app/src/main/AndroidManifest.xml`

Proyek ini dibuat tanpa menjalankan `flutter create` di sandbox, jadi
folder `android/` bawaan Flutter (Gradle, Manifest lengkap, dsb) BELUM ada.

Langkah termudah:

1. Jalankan `flutter create .` di root proyek ini (akan mengisi folder
   `android/`, `ios/`, dll tanpa menimpa folder `lib/` yang sudah dibuat).
2. Buka `android/app/src/main/AndroidManifest.xml`, lalu tambahkan
   permission berikut tepat di atas tag `<application>`:

```xml
<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM"/>
<uses-permission android:name="android.permission.USE_EXACT_ALARM"/>
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
<uses-permission android:name="android.permission.VIBRATE"/>
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.WAKE_LOCK"/>
```

3. Di dalam tag `<application>`, pastikan ada receiver berikut agar alarm
   tetap terjadwal setelah HP di-restart (disediakan otomatis oleh
   package `flutter_local_notifications`, tinggal didaftarkan):

```xml
<receiver android:exported="false"
    android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
    <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED"/>
    </intent-filter>
</receiver>
```

4. Letakkan file suara alarm (format `.mp3`) di:
   `assets/sounds/alarm_sound.mp3`
   — untuk notifikasi Android yang butuh format `.mp3`/`.wav` sebagai raw
   resource, salin juga ke `android/app/src/main/res/raw/alarm_sound.mp3`.

Semua detail ini juga dijelaskan di README.md pada bagian "Setup Awal".
