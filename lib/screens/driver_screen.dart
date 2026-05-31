import 'package:flutter/material.dart';
import '../utils/app_style.dart';
import 'driver_detail_screen.dart';

class DriverScreen extends StatelessWidget {
  const DriverScreen({super.key});

  final List<Map<String, String>> drivers = const [
    {
      'name': 'Pak Urip',
      'experience': '25+ Years',
      'languages': 'Indonesian, English, Arabic basic',
      'specialty': 'Family Tour • Flexible Route',
      'image': 'assets/images/logoapk.png',
    },
    {
      'name': 'Driver Made',
      'experience': '15+ Years',
      'languages': 'Indonesian, English',
      'specialty': 'Temple Tour • Sunset Trip',
      'image': 'assets/images/logoapk.png',
    },
    {
      'name': 'Driver Wayan',
      'experience': '12+ Years',
      'languages': 'Indonesian, English',
      'specialty': 'Ubud • Kintamani • Nature Trip',
      'image': 'assets/images/logoapk.png',
    },
    {
      'name': 'Driver Kadek',
      'experience': '10+ Years',
      'languages': 'Indonesian, English',
      'specialty': 'Beach Tour • Photography Spots',
      'image': 'assets/images/logoapk.png',
    },
    {
      'name': 'Driver Komang',
      'experience': '8+ Years',
      'languages': 'Indonesian, English',
      'specialty': 'Airport Transfer • City Tour',
      'image': 'assets/images/logoapk.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar: AppBar(title: const Text('Our Drivers')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text('Meet Our Local Drivers', style: AppStyle.title),
          const SizedBox(height: 8),
          const Text(
            'Choose experienced Bali drivers who can help you explore Bali with flexible routes.',
            style: AppStyle.body,
          ),
          const SizedBox(height: 20),
          ...drivers.map((driver) {
            return _DriverCard(driver: driver);
          }),
        ],
      ),
    );
  }
}

class _DriverCard extends StatelessWidget {
  final Map<String, String> driver;

  const _DriverCard({required this.driver});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DriverDetailScreen(driver: driver),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppStyle.radius20,
          boxShadow: AppStyle.softShadow,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 38,
              backgroundColor: AppStyle.primary.withOpacity(0.12),
              backgroundImage: AssetImage(driver['image']!),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    driver['name']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 6),
                  _SmallInfo(
                    icon: Icons.workspace_premium_rounded,
                    text: driver['experience']!,
                  ),
                  const SizedBox(height: 4),
                  _SmallInfo(
                    icon: Icons.language_rounded,
                    text: driver['languages']!,
                  ),
                  const SizedBox(height: 4),
                  _SmallInfo(
                    icon: Icons.route_rounded,
                    text: driver['specialty']!,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SmallInfo({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15, color: AppStyle.primary),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: AppStyle.body.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }
}