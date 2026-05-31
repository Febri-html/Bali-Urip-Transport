import 'package:flutter/material.dart';
import 'booking_screen.dart';

class DestinationDetailScreen extends StatefulWidget {
  final String image;           // gambar lokal utama (dari destinations_data)
  final String title;
  final String description;
  final String tag;
  final String location;
  final List<String> highlights;
  final String bestTime;
  final String duration;
  final List<String> localImages;
  final List<String> networkImages; // fallback kalau lokal belum ada

  const DestinationDetailScreen({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.tag,
    required this.location,
    required this.highlights,
    required this.bestTime,
    required this.duration,
    required this.localImages,
    required this.networkImages,
  });

  @override
  State<DestinationDetailScreen> createState() =>
      _DestinationDetailScreenState();
}

class _DestinationDetailScreenState extends State<DestinationDetailScreen> {
  int _selectedImage = 0;

  static const Color primary = Color(0xFF006D77);
  static const Color orange = Color(0xFFFFA62B);

  // Derive local image paths dari image utama
  // Contoh: 'assets/images/destinations/spiritual/tanah_lot.jpg'
  // → gallery: tanah_lot_1.jpg, tanah_lot_2.jpg, tanah_lot_3.jpg
  // Kalau file gallery belum ada, otomatis fallback ke networkImages
  List<String> get _localGallery {
    final base = widget.image; // e.g. assets/images/destinations/spiritual/tanah_lot.jpg
    final withoutExt = base.replaceAll(RegExp(r'\.\w+$'), ''); // tanggalin .jpg
    final ext = base.contains('.') ? '.${base.split('.').last}' : '.jpg';
    return [
      base,                          // foto 1 = foto utama
      '${withoutExt}_2$ext',         // foto 2
      '${withoutExt}_3$ext',         // foto 3
    ];
  }

  @override
  Widget build(BuildContext context) {
    final localGallery = widget.localImages;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F7),
      body: Stack(
        children: [
          // ── SCROLLABLE CONTENT ─────────────────────────────────
          CustomScrollView(
            slivers: [
              // ── PHOTO HEADER ─────────────────────────────────
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    // Foto utama — local asset dulu, fallback ke network
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: _GalleryImage(
                        key: ValueKey(_selectedImage),
                        localPath: localGallery[_selectedImage],
                        networkUrl: widget.networkImages[_selectedImage],
                        height: 320,
                      ),
                    ),

                    // Gradient overlay bawah
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 120,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Color(0xFFF2F7F7), Colors.transparent],
                          ),
                        ),
                      ),
                    ),

                    // Tombol back
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 10,
                      left: 16,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.35),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),

                    // Foto counter
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 14,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${_selectedImage + 1}/${localGallery.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── THUMBNAIL GALLERY ──────────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: Row(
                    children: List.generate(
                      localGallery.length,
                      (i) => GestureDetector(
                        onTap: () => setState(() => _selectedImage = i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(right: 10),
                          width: 70,
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: _selectedImage == i
                                  ? primary
                                  : Colors.transparent,
                              width: 2.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: _GalleryImage(
                              localPath: localGallery[i],
                              networkUrl: widget.networkImages[i],
                              height: 56,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // ── KONTEN DETAIL ──────────────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 20, 18, 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Judul + lokasi
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_rounded,
                                      size: 14,
                                      color: Colors.black38,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.location,
                                      style: const TextStyle(
                                        color: Colors.black45,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Info row (best time + duration)
                      Row(
                        children: [
                          _InfoChip(
                            icon: Icons.wb_sunny_rounded,
                            label: 'Best Time',
                            value: widget.bestTime,
                            color: orange,
                          ),
                          const SizedBox(width: 10),
                          _InfoChip(
                            icon: Icons.timer_rounded,
                            label: 'Duration',
                            value: widget.duration,
                            color: primary,
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Highlights
                      const Text(
                        'Highlights',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: widget.highlights
                            .map(
                              (h) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 7,
                                ),
                                decoration: BoxDecoration(
                                  color: primary.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: primary.withOpacity(0.2),
                                    width: 0.8,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.check_circle_rounded,
                                      size: 13,
                                      color: primary,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      h,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),

                      const SizedBox(height: 20),

                      // Deskripsi
                      const Text(
                        'About This Place',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                          height: 1.7,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Tips box
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: orange.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: orange.withOpacity(0.25),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: orange.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.tips_and_updates_rounded,
                                color: orange,
                                size: 16,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Travel Tip',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 13,
                                      color: orange,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Our local driver knows the best hidden spots, shortcuts, and local warungs nearby. Ask them for insider recommendations!',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ── STICKY BOTTOM BUTTON ──────────────────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 28),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F7F7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Tombol back kecil
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Tombol Book Now
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookingScreen(
                              selectedDriver: 'Destination: ${widget.title}',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFFB347), Color(0xFFFFA62B)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: orange.withOpacity(0.4),
                              blurRadius: 14,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Book This Destination',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── WIDGET: Gallery Image (local → network fallback) ──────────────────────────
class _GalleryImage extends StatelessWidget {
  final String localPath;
  final String networkUrl;
  final double height;

  const _GalleryImage({
    super.key,
    required this.localPath,
    required this.networkUrl,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      localPath,
      height: height,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => Image.network(
        networkUrl,
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            height: height,
            color: Colors.grey.shade200,
            child: const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF006D77),
                strokeWidth: 2,
              ),
            ),
          );
        },
        errorBuilder: (_, __, ___) => Container(
          height: height,
          color: Colors.grey.shade200,
          child: const Center(
            child: Icon(Icons.image_not_supported_rounded, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

// ── WIDGET: Info Chip ─────────────────────────────────────────────────────────
class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 2),
              color: Colors.black.withOpacity(0.05),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 14),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}