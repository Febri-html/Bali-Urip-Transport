import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'destination_list_screen.dart';
import 'driver_screen.dart';
import 'booking_history_screen.dart';
import 'about_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int currentIndex = 0;

  void _switchTab(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack: semua tab tetap hidup, state gak reset waktu pindah tab
      body: IndexedStack(
        index: currentIndex,
        children: [
          // Pass callback ke HomeScreen biar bisa switch tab dari dalam
          HomeScreen(onSwitchTab: _switchTab),
          const DestinationListScreen(),
          const BookingHistoryScreen(),
          const AboutScreen(),
          const DriverScreen(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 11,
        unselectedFontSize: 10,
        currentIndex: currentIndex,
        onTap: _switchTab,
        selectedItemColor: const Color(0xFF006D77),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_rounded),
            label: 'Destinations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_rounded),
            label: 'Driver',
          ),
        ],
      ),
    );
  }
}