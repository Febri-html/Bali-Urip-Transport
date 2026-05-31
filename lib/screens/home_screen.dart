import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'profile_screen.dart';
import 'destination_detail_screen.dart';
import 'booking_screen.dart';
import 'booking_history_screen.dart';
import '../widgets/welcome_popup.dart';
import '../widgets/home_hero_video.dart';

class HomeScreen extends StatefulWidget {
  /// Callback untuk switch tab dari MainNavigationScreen
  /// index: 0=Home, 1=Destinations, 2=History, 3=About, 4=Driver
  final void Function(int index)? onSwitchTab;

  const HomeScreen({super.key, this.onSwitchTab});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool hasShownPopup = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!hasShownPopup) {
        hasShownPopup = true;

        showDialog(context: context, builder: (_) => const WelcomePopup());
      }
    });
  }

  static const Color primary = Color(0xFF006D77);
  static const Color orange = Color(0xFFFFA62B);
  static const Color softBg = Color(0xFFF2F7F7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── TOP BAR ──────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: primary.withOpacity(0.15),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/logoapk_1.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bali Urip Transport',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.3,
                            ),
                          ),
                          Text(
                            'Private Driver & Flexible Tour',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: Hive.box('profile').listenable(),
                      builder: (context, Box profileBox, _) {
                        final imagePath = profileBox.get('profileImagePath');

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ProfileScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: primary.withOpacity(0.15),
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: primary.withOpacity(0.08),
                              backgroundImage: imagePath != null
                                  ? FileImage(File(imagePath))
                                  : null,
                              child: imagePath == null
                                  ? Icon(Icons.person, color: primary)
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              // ── BANNER OTW VIDIO BOS ───────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Stack(
                    children: [
                      const HomeHeroVideo(),

                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: const [0.0, 0.5, 1.0],
                            colors: [
                              Colors.black.withOpacity(0.80),
                              Colors.black.withOpacity(0.30),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 14,
                        left: 14,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: Colors.white,
                                size: 12,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '25 Years Experience',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 16,
                        right: 16,
                        bottom: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Explore Bali\nYour Way 🌴',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                height: 1.2,
                                letterSpacing: -0.5,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Flexible route  •  Local guide  •  Comfortable trip',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // ── 3 INFO CARD ───────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: const [
                    Expanded(
                      child: _InfoCard(
                        icon: Icons.access_time_rounded,
                        title: '9 Jam',
                        subtitle: 'Per trip',
                        color: Color(0xFF006D77),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _InfoCard(
                        icon: Icons.route_rounded,
                        title: 'Fleksibel',
                        subtitle: 'Custom rute',
                        color: Color(0xFFFFA62B),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _InfoCard(
                        icon: Icons.payments_rounded,
                        title: '500K',
                        subtitle: 'Mulai dari',
                        color: Color(0xFF4CAF82),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── LAYANAN KAMI ──────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Layanan Kami',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.3,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BookingScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Book Now →',
                        style: TextStyle(
                          fontSize: 13,
                          color: primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    _ServiceTile(
                      icon: Icons.directions_car_rounded,
                      title: 'Private Driver',
                      subtitle: 'Mobil AC nyaman untuk trip Bali kamu.',
                      color: Color(0xFF006D77),
                    ),
                    _ServiceTile(
                      icon: Icons.person_pin_circle_rounded,
                      title: 'Local Tour Guide',
                      subtitle: 'Guide lokal yang hafal setiap jalur Bali.',
                      color: Color(0xFFFFA62B),
                    ),
                    _ServiceTile(
                      icon: Icons.chat_rounded,
                      title: 'Booking via WhatsApp',
                      subtitle: 'Langsung konfirmasi, cepat & mudah.',
                      color: Color(0xFF25D366),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── DESTINASI POPULER ─────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Destinasi Populer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.3,
                      ),
                    ),
                    GestureDetector(
                      // ✅ Switch ke tab Destinations, BUKAN Navigator.push
                      onTap: () => widget.onSwitchTab?.call(1),
                      child: Text(
                        'Lihat semua →',
                        style: TextStyle(
                          fontSize: 13,
                          color: primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              SizedBox(
                height: 195,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 18, right: 4),
                  children: const [
                    _DestinationCard(
                      image: 'assets/images/destinations/alam/bedugul1.jpeg',
                      title: 'Bedugul',
                      tag: 'Alam',
                      tagColor: Color(0xFF059669),
                    ),
                    _DestinationCard(
                      image:
                          'assets/images/destinations/spiritual/uluwatu2.jpeg',
                      title: 'Uluwatu',
                      tag: 'Spiritual',
                      tagColor: Color(0xFF7C3AED),
                    ),
                    _DestinationCard(
                      image:
                          'assets/images/destinations/spiritual/tanah_lot.jpeg',
                      title: 'Tanah Lot',
                      tag: 'Spiritual',
                      tagColor: Color(0xFF7C3AED),
                    ),
                    _DestinationCard(
                      image: 'assets/images/destinations/pantai/klingking.jpeg',
                      title: 'Kelingking',
                      tag: 'Pantai',
                      tagColor: Color(0xFF0284C7),
                    ),
                    _DestinationCard(
                      image: 'assets/images/destinations/alam/tegalalang.jpeg',
                      title: 'Tegalalang',
                      tag: 'Alam',
                      tagColor: Color(0xFF059669),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── WHY CHOOSE US ─────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: primary.withOpacity(0.3),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kenapa Pilih Kami? 🤝',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 14),
                      _WhyItem(
                        icon: Icons.verified_rounded,
                        text: 'Driver berpengalaman 25+ tahun di Bali',
                      ),
                      _WhyItem(
                        icon: Icons.route_rounded,
                        text: 'Rute bebas sesuai keinginan kamu',
                      ),
                      _WhyItem(
                        icon: Icons.groups_rounded,
                        text: 'Melayani wisatawan lokal & mancanegara',
                      ),
                      _WhyItem(
                        icon: Icons.attach_money_rounded,
                        text: 'Harga transparan, mulai Rp500.000/hari',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ── BOOKING BUTTON ────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFB347), Color(0xFFFFA62B)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: orange.withOpacity(0.4),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BookingScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 54),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today_rounded, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Mulai Booking Sekarang',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // ── HISTORY SHORTCUT ──────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: GestureDetector(
                  // ✅ Switch ke tab History (index 2), BUKAN Navigator.push
                  onTap: () => widget.onSwitchTab?.call(2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: primary.withOpacity(0.2),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history_rounded, color: primary, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          'Lihat Riwayat Booking',
                          style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: primary,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) return 'Selamat Pagi';
    if (hour >= 12 && hour < 15) return 'Selamat Siang';
    if (hour >= 15 && hour < 18) return 'Selamat Sore';
    return 'Selamat Malam';
  }
}

// ── WIDGET: Why Item ──────────────────────────────────────────────────────────
class _WhyItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _WhyItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 15),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── WIDGET: Info Card ─────────────────────────────────────────────────────────
class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.06),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, color: Colors.black45),
          ),
        ],
      ),
    );
  }
}

// ── WIDGET: Service Tile ──────────────────────────────────────────────────────
class _ServiceTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _ServiceTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.04),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black45, fontSize: 12),
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
    );
  }
}

// ── WIDGET: Destination Card ──────────────────────────────────────────────────
class _DestinationCard extends StatelessWidget {
  final String image;
  final String title;
  final String tag;
  final Color tagColor;

  const _DestinationCard({
    required this.image,
    required this.title,
    required this.tag,
    required this.tagColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DestinationDetailScreen(
              image: image,
              title: title,
              description:
                  'Salah satu destinasi terbaik di Bali yang wajib kamu kunjungi. Nikmati keindahan alam dan budaya Bali yang autentik bersama guide lokal kami.',
              tag: tag,
              location: 'Bali, Indonesia',
              highlights: const ['Must Visit', 'Photo Spot', 'Local Culture'],
              bestTime: 'Pagi atau Sunset',
              duration: '1 – 3 jam',
              localImages: [image, image, image],
              networkImages: const [
                'https://images.unsplash.com/photo-1537953773345-d172ccf13cf1?w=800',
                'https://images.unsplash.com/photo-1555400038-63f5ba517a47?w=800',
                'https://images.unsplash.com/photo-1573790387438-4da905039392?w=800',
              ],
            ),
          ),
        );
      },
      child: Container(
        width: 155,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(0.12),
            ),
          ],
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black.withOpacity(0.78), Colors.transparent],
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: tagColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.3,
                ),
              ),
              const SizedBox(height: 2),
              const Row(
                children: [
                  Icon(
                    Icons.touch_app_rounded,
                    color: Colors.white60,
                    size: 11,
                  ),
                  SizedBox(width: 3),
                  Text(
                    'Tap to explore',
                    style: TextStyle(color: Colors.white60, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
