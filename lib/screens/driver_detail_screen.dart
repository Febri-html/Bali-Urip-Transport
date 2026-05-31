import 'package:flutter/material.dart';
import '../utils/app_style.dart';
import 'booking_screen.dart';

class DriverDetailScreen extends StatelessWidget {
  final Map<String, String> driver;

  const DriverDetailScreen({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar: AppBar(title: Text(driver['name']!)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage(driver['image']!),
            ),
            const SizedBox(height: 18),
            Text(driver['name']!, style: AppStyle.title),
            const SizedBox(height: 8),
            Text(
              'Local Bali Driver & Tour Guide',
              style: AppStyle.body,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            _DetailTile(
              icon: Icons.workspace_premium_rounded,
              title: 'Experience',
              value: driver['experience']!,
            ),
            _DetailTile(
              icon: Icons.language_rounded,
              title: 'Languages',
              value: driver['languages']!,
            ),
            _DetailTile(
              icon: Icons.route_rounded,
              title: 'Specialty',
              value: driver['specialty']!,
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppStyle.primary,
                borderRadius: AppStyle.radius20,
              ),
              child: const Text(
                '"Let’s explore Bali with flexible routes and local experience."',
                style: TextStyle(
                  color: Colors.white,
                  height: 1.5,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text('Back to Drivers'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _DetailTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppStyle.radius16,
        boxShadow: AppStyle.softShadow,
      ),
      child: Row(
        children: [
          Icon(icon, color: AppStyle.primary),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 3),
                Text(value, style: AppStyle.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
