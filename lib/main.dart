import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:device_frame/device_frame.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // ← tambah

import 'screens/splash_screen.dart';
import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ←inisialisasi sqflite untuk Windows/desktop
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  await Hive.initFlutter();
  await Hive.openBox('bookings');
  await Hive.openBox('profile');

  runApp(
    Platform.isWindows
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.grey.shade300,
              body: Center(
                child: DeviceFrame(
                  device: Devices.ios.iPhone15ProMax,
                  screen: const BaliUripTransportApp(),
                ),
              ),
            ),
          )
        : const BaliUripTransportApp(),
  );
}

class BaliUripTransportApp extends StatelessWidget {
  const BaliUripTransportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bali Urip Transport',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}