import 'package:flutter/material.dart';

class AppStyle {
  static const Color primary = Color(0xFF006D77);
  static const Color orange = Color(0xFFFFA62B);
  static const Color green = Color(0xFF4CAF82);
  static const Color whatsapp = Color(0xFF25D366);
  static const Color background = Color(0xFFF2F7F7);
  static const Color textDark = Color(0xFF1E1E1E);
  static const Color textSoft = Colors.black54;

  static BorderRadius radius16 = BorderRadius.circular(16);
  static BorderRadius radius20 = BorderRadius.circular(20);
  static BorderRadius radius24 = BorderRadius.circular(24);

  static List<BoxShadow> softShadow = [
    BoxShadow(
      blurRadius: 12,
      offset: const Offset(0, 5),
      color: Colors.black.withOpacity(0.06),
    ),
  ];

  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    letterSpacing: -0.5,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.3,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: Colors.black54,
    height: 1.5,
  );
}
