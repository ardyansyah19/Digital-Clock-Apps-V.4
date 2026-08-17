import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'screens/home_screen.dart';
import 'screens/alarm_ring_screen.dart';
import 'services/notification_service.dart';
import 'services/alarm_service.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Siapkan format tanggal Bahasa Indonesia (nama hari & bulan).
  await initializeDateFormatting('id_ID', null);

  // Siapkan sistem notifikasi lokal untuk fitur alarm.
  await NotificationService.instance.init();
  await NotificationService.instance.requestPermissions();

  // Jadwalkan ulang semua alarm aktif yang tersimpan (mis. setelah app di-restart).
  await AlarmService.instance.rescheduleAllActive();

  runApp(const DigitalClockApp());
}

class DigitalClockApp extends StatefulWidget {
  const DigitalClockApp({super.key});

  @override
  State<DigitalClockApp> createState() => _DigitalClockAppState();
}

class _DigitalClockAppState extends State<DigitalClockApp> {
  bool _isDark = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jam Digital',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(
        isDark: _isDark,
        onThemeChanged: (value) => setState(() => _isDark = value),
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/alarm-ring') {
          final payload = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (_) => AlarmRingScreen(payload: payload),
          );
        }
        return null;
      },
    );
  }
}
