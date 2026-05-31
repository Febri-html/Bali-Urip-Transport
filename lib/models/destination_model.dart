// ── DESTINATION MODEL ─────────────────────────────────────────────────────────
// lib/models/destination_model.dart

import 'package:flutter/material.dart';

class Destination {
  final String title;
  final String location;
  final String tag;
  final Color tagColor;
  final String description;
  final String image; // foto utama (card list)
  final List<String>
  localImages; // 3 foto lokal untuk gallery detail (bebas nama & ekstensi)
  final List<String> networkImages; // fallback kalau lokal belum ada
  final List<String> highlights;
  final String bestTime;
  final String duration;

  const Destination({
    required this.title,
    required this.location,
    required this.tag,
    required this.tagColor,
    required this.description,
    required this.image,
    required this.localImages,
    required this.networkImages,
    required this.highlights,
    required this.bestTime,
    required this.duration,
  });
}

// ── TAG COLORS ────────────────────────────────────────────────────────────────
class TagColors {
  static const Color spiritual = Color.fromARGB(255, 62, 43, 96);
  static const Color alam = Color(0xFF059669);
  static const Color pantai = Color(0xFF0284C7);
  static const Color budaya = Color(0xFFD97706);
  static const Color adventure = Color(0xFFDC2626);
  static const Color waterSport = Color.fromARGB(255, 42, 121, 164);
  static const Color island = Color.fromARGB(255, 10, 206, 255);

  static Color fromTag(String tag) {
    switch (tag) {
      case 'Spiritual':
        return spiritual;
      case 'Alam':
        return alam;
      case 'Pantai':
        return pantai;
      case 'Budaya':
        return budaya;
      case 'Adventure':
        return adventure;
      case 'Water Sport':
        return waterSport;
      case 'Island':
        return island;
      default:
        return const Color(0xFF6B7280);
    }
  }
}
