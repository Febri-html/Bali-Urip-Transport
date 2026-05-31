import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/booking_model.dart';
import '../utils/app_style.dart';

class BookingScreen extends StatefulWidget {
  final String? selectedDriver;

  const BookingScreen({super.key, this.selectedDriver});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController peopleController = TextEditingController();
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  void initState() {
    super.initState();

    notesController.text = widget.selectedDriver == null
        ? ''
        : 'Preferred Driver: ${widget.selectedDriver}';
  }

  String selectedDestination = 'Not sure yet';

  final List<String> destinations = [
    'Not sure yet',
    'Follow guide recommendation',
    'Custom request in notes',
  ];
  @override
  Future<void> openWhatsApp() async {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        countryController.text.isEmpty ||
        languageController.text.isEmpty ||
        peopleController.text.isEmpty ||
        pickupController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all required fields')),
      );

      return;
    }
    final message =
        '''
Hello, I want to book Bali Urip Transport.

Name: ${nameController.text}
WhatsApp: ${phoneController.text}
Country: ${countryController.text}
Language: ${languageController.text}
Number of People: ${peopleController.text}
Pickup Location: ${pickupController.text}
Destination Preference: $selectedDestination
Notes / Custom Request:
${notesController.text}

Service: Private Driver & Flexible Tour
Duration: Flexible
Starting from: \$29
''';

    final bookingBox = Hive.box('bookings');

    final booking = BookingModel(
      name: nameController.text,
      phone: phoneController.text,
      country: countryController.text,
      language: languageController.text,
      people: peopleController.text,
      pickup: pickupController.text,
      destination: selectedDestination,
      notes: notesController.text,
    );

    bookingBox.add(booking.toMap());

    final url = Uri.parse(
      'https://wa.me/628164731797?text=${Uri.encodeComponent(message)}',
    );

    if (await canLaunchUrl(url)) {
      nameController.clear();
      phoneController.clear();
      countryController.clear();
      languageController.clear();
      peopleController.clear();
      pickupController.clear();
      notesController.clear();
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar: AppBar(title: const Text('Booking')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Book Your Bali Trip', style: AppStyle.title),

            const SizedBox(height: 8),

            const Text(
              'Fill the form below to start booking.',
              style: AppStyle.body,
            ),

            const SizedBox(height: 24),

            if (widget.selectedDriver != null)
              Container(
                margin: const EdgeInsets.only(bottom: 20),

                padding: const EdgeInsets.all(14),

                decoration: BoxDecoration(
                  color: AppStyle.primary.withOpacity(0.08),

                  borderRadius: AppStyle.radius16,
                ),

                child: Row(
                  children: [
                    Icon(Icons.person_pin, color: AppStyle.primary),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        'Selected Driver:\n${widget.selectedDriver}',

                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            _buildTextField(
              controller: nameController,
              label: 'Full Name',
              icon: Icons.person,
            ),

            const SizedBox(height: 16),

            _buildTextField(
              controller: phoneController,
              label: 'WhatsApp Number',
              icon: Icons.phone,
            ),

            const SizedBox(height: 16),

            _buildTextField(
              controller: countryController,
              label: 'Country',
              icon: Icons.flag,
            ),

            const SizedBox(height: 16),

            _buildTextField(
              controller: peopleController,
              label: 'Number of People',
              icon: Icons.group,
            ),

            const SizedBox(height: 16),

            _buildTextField(
              controller: pickupController,
              label: 'Pickup Location',
              icon: Icons.location_on,
            ),

            const SizedBox(height: 16),

            _buildTextField(
              controller: languageController,
              label: 'Preferred Language',
              icon: Icons.language,
            ),
            const SizedBox(height: 16),

            const Text(
              'Destination Preference',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 8),

            _buildDropdown(
              value: selectedDestination,
              items: destinations,
              onChanged: (value) {
                setState(() {
                  selectedDestination = value!;
                });
              },
            ),

            const SizedBox(height: 16),

            _buildTextField(
              controller: notesController,
              label: 'Notes / Custom Request',
              icon: Icons.note,
              maxLines: 4,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  openWhatsApp();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppStyle.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Submit Booking',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppStyle.radius16,
        boxShadow: AppStyle.softShadow,
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          prefixIcon: Icon(icon, color: AppStyle.primary),
          border: OutlineInputBorder(
            borderRadius: AppStyle.radius16,
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppStyle.radius16,
        boxShadow: AppStyle.softShadow,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          items: items.map((item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
