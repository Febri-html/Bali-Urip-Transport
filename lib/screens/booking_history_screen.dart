import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../utils/app_style.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({super.key});

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  final Set<int> selected = {};

  // ── Dialog konfirmasi delete ──────────────────────────────────────────────
  Future<bool> _confirmDelete(String message) async {
    //  pakai mounted + context langsung dari class,
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Konfirmasi',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false), //  pakai ctx 
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  Future<void> _deleteSelected(Box box) async {
    final confirm = await _confirmDelete(
      'Hapus ${selected.length} booking yang dipilih?',
    );
    if (!confirm || !mounted) return;

    // Sort descending biar index tidak geser saat delete
    final sorted = selected.toList()..sort((a, b) => b.compareTo(a));
    for (final i in sorted) {
      if (i < box.length) await box.deleteAt(i);
    }
    setState(() => selected.clear());
  }

  @override
  Widget build(BuildContext context) {
    final bookingBox = Hive.box('bookings');

    return Scaffold(
      backgroundColor: AppStyle.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── HEADER ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Booking History',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          selected.isEmpty
                              ? 'Swipe kiri hapus • Hold untuk pilih'
                              : '${selected.length} dipilih — tap card lagi untuk batal',
                          style: TextStyle(
                            fontSize: 12,
                            color: selected.isEmpty
                                ? Colors.black45
                                : AppStyle.orange,
                            fontWeight: selected.isEmpty
                                ? FontWeight.normal
                                : FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Tombol hapus selected (muncul kalau ada yang dipilih)
                  if (selected.isNotEmpty) ...[
                    // Tombol cancel selection
                    IconButton(
                      onPressed: () => setState(() => selected.clear()),
                      icon: const Icon(Icons.close_rounded),
                      color: Colors.black45,
                      tooltip: 'Batal pilih',
                    ),
                    // Tombol delete
                    ElevatedButton.icon(
                      onPressed: () => _deleteSelected(bookingBox),
                      icon: const Icon(Icons.delete_rounded, size: 16),
                      label: Text('Hapus (${selected.length})'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],

                  // Tombol clear all (muncul kalau tidak ada selection)
                  if (selected.isEmpty)
                    ValueListenableBuilder(
                      valueListenable: bookingBox.listenable(),
                      builder: (context, Box box, _) {
                        if (box.isEmpty) return const SizedBox();
                        return TextButton.icon(
                          onPressed: () async {
                            final confirm = await _confirmDelete(
                              'Hapus semua riwayat booking?',
                            );
                            if (confirm && mounted) {
                              await bookingBox.clear();
                              setState(() {});
                            }
                          },
                          icon: const Icon(Icons.delete_sweep_rounded,
                              size: 16),
                          label: const Text('Hapus Semua'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            textStyle: const TextStyle(fontSize: 13),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── LIST ─────────────────────────────────────────────────
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: bookingBox.listenable(),
                builder: (context, Box box, _) {
                  if (box.isEmpty) {
                    return const _EmptyState();
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      final booking = box.getAt(index);
                      final displayIndex = box.length - index;
                      final isSelected = selected.contains(index);

                      return Dismissible(
                        // ✅ key pakai booking key dari Hive, bukan index
                        key: ValueKey(box.keyAt(index)),
                        direction: selected.isEmpty
                            ? DismissDirection.endToStart
                            : DismissDirection.none, // ✅ disable swipe saat mode selection
                        background: Container(
                          margin: const EdgeInsets.only(bottom: 14),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 24),
                          decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.delete_rounded,
                                  color: Colors.white, size: 28),
                              SizedBox(height: 4),
                              Text(
                                'Hapus',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        confirmDismiss: (_) async {
                          // ✅ pakai method _confirmDelete yang pakai context class
                          return await _confirmDelete(
                            'Hapus booking untuk "${booking['name']}"?',
                          );
                        },
                        onDismissed: (_) async {
                          await box.deleteAt(index);
                          setState(() => selected.remove(index));
                        },
                        child: GestureDetector(
                          onLongPress: () {
                            setState(() {
                              if (isSelected) {
                                selected.remove(index);
                              } else {
                                selected.add(index);
                              }
                            });
                          },
                          onTap: selected.isNotEmpty
                              ? () {
                                  // ✅ kalau mode selection aktif, tap = toggle select
                                  setState(() {
                                    if (isSelected) {
                                      selected.remove(index);
                                    } else {
                                      selected.add(index);
                                    }
                                  });
                                }
                              : null,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: isSelected
                                  ? Border.all(
                                      color: AppStyle.orange, width: 2.5)
                                  : null,
                            ),
                            child: Stack(
                              children: [
                                _BookingCard(
                                  booking: booking,
                                  index: displayIndex,
                                ),
                                // ✅ Checkmark overlay saat selected
                                if (isSelected)
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                        color: AppStyle.orange,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppStyle.orange
                                                .withOpacity(0.4),
                                            blurRadius: 6,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.check_rounded,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── WIDGET: Empty State ───────────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: AppStyle.primary.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.receipt_long_rounded,
              size: 56,
              color: AppStyle.primary.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Belum Ada Booking',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Riwayat booking kamu akan muncul di sini\nsetelah kamu submit trip.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ── WIDGET: Booking Card ──────────────────────────────────────────────────────
class _BookingCard extends StatelessWidget {
  final dynamic booking;
  final int index;

  const _BookingCard({required this.booking, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppStyle.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Card Header ─────────────────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppStyle.primary,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '#$index',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    booking['name'] ?? '-',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppStyle.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Submitted',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Card Body ───────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _BookingRow(
                  icon: Icons.phone_rounded,
                  label: 'WhatsApp',
                  value: booking['phone'] ?? '-',
                ),
                _BookingRow(
                  icon: Icons.flag_rounded,
                  label: 'Country',
                  value: booking['country'] ?? '-',
                ),
                _BookingRow(
                  icon: Icons.language_rounded,
                  label: 'Language',
                  value: booking['language'] ?? '-',
                ),
                _BookingRow(
                  icon: Icons.group_rounded,
                  label: 'People',
                  value: booking['people'] ?? '-',
                ),
                _BookingRow(
                  icon: Icons.location_on_rounded,
                  label: 'Pickup',
                  value: booking['pickup'] ?? '-',
                ),
                _BookingRow(
                  icon: Icons.place_rounded,
                  label: 'Destination',
                  value: booking['destination'] ?? '-',
                ),
                if (booking['notes'] != null &&
                    booking['notes'].toString().isNotEmpty) ...[
                  const SizedBox(height: 4),
                  const Divider(height: 1),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.notes_rounded,
                          size: 16, color: AppStyle.primary),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Notes',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.black45,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              booking['notes'],
                              style: const TextStyle(
                                  fontSize: 13, height: 1.4),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── WIDGET: Row Info ──────────────────────────────────────────────────────────
class _BookingRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _BookingRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppStyle.primary),
          const SizedBox(width: 10),
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black45,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}