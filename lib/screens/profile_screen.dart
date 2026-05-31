import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

import 'login_screen.dart';
import '../database/user_database.dart';
import '../utils/app_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileBox = Hive.box('profile');

  late TextEditingController nameController;
  late TextEditingController countryController;
  late TextEditingController languageController;

  bool isEditing = false;
  String? profileImagePath;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(
      text: profileBox.get('name', defaultValue: 'Guest Traveler'),
    );
    countryController = TextEditingController(
      text: profileBox.get('country', defaultValue: 'Indonesia'),
    );
    languageController = TextEditingController(
      text: profileBox.get('language', defaultValue: 'English'),
    );

    profileImagePath = profileBox.get('profileImagePath');
  }

  Future<void> pickProfileImage() async {
    if (!isEditing) return;

    final picker = ImagePicker();

    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedImage != null) {
      setState(() {
        profileImagePath = pickedImage.path;
      });
    }
  }

  Future<void> saveProfile() async {
    final userId = profileBox.get('userId');

    if (userId != null) {
      await UserDatabase.instance.updateUsername(
        id: userId,
        username: nameController.text,
      );
    }

    profileBox.put('name', nameController.text);
    profileBox.put('country', countryController.text);
    profileBox.put('language', languageController.text);

    if (profileImagePath != null) {
      profileBox.put('profileImagePath', profileImagePath);
    }

    setState(() {
      isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated')),
    );
  }

  void logout() {
    profileBox.put('isLoggedIn', false);
    profileBox.delete('userId');
    profileBox.delete('email');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final name = profileBox.get('name', defaultValue: 'Guest Traveler');
    final email = profileBox.get('email', defaultValue: 'No email');

    return Scaffold(
      backgroundColor: AppStyle.background,
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
            icon: Icon(
              isEditing ? Icons.close_rounded : Icons.edit_rounded,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF004F59), Color(0xFF006D77)],
                ),
                borderRadius: AppStyle.radius24,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: pickProfileImage,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 58,
                          backgroundColor: Colors.white,
                          backgroundImage: profileImagePath != null
                              ? FileImage(File(profileImagePath!))
                              : null,
                          child: profileImagePath == null
                              ? Icon(
                                  Icons.person_rounded,
                                  size: 62,
                                  color: AppStyle.primary,
                                )
                              : null,
                        ),
                        if (isEditing)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: AppStyle.orange,
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    email,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            _input(
              controller: nameController,
              label: 'Username',
              icon: Icons.person,
              enabled: isEditing,
            ),

            const SizedBox(height: 14),

            _input(
              controller: countryController,
              label: 'Country',
              icon: Icons.flag,
              enabled: isEditing,
            ),

            const SizedBox(height: 14),

            _input(
              controller: languageController,
              label: 'Preferred Language',
              icon: Icons.language,
              enabled: isEditing,
            ),

            const SizedBox(height: 24),

            if (isEditing)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: saveProfile,
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('Save Profile'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyle.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: AppStyle.radius16,
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 14),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: logout,
                icon: const Icon(Icons.logout_rounded),
                label: const Text('Logout'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppStyle.radius16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _input({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  required bool enabled,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: AppStyle.radius16,
      boxShadow: AppStyle.softShadow,
    ),

    child: TextField(

      controller: controller,

      readOnly: !enabled,

      style: TextStyle(
        color: AppStyle.textDark,
        fontWeight: FontWeight.w600,
      ),

      decoration: InputDecoration(

        labelText: label,

        labelStyle: TextStyle(
          color: Colors.grey.shade500,
        ),

        prefixIcon: Icon(
          icon,
          color: AppStyle.primary,
        ),

        filled: true,

        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: AppStyle.radius16,
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: AppStyle.radius16,

          borderSide: BorderSide(
            color:
                enabled
                    ? AppStyle.primary.withOpacity(
                        0.18,
                      )
                    : Colors.transparent,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: AppStyle.radius16,

          borderSide: BorderSide(
            color: AppStyle.orange,
            width: 2,
          ),
        ),
      ),
    ),
  );
}
}