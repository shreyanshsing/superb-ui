import 'package:flutter/material.dart';
import 'package:video_streaming_ui/pages/account/widgets/info_field.dart';
import 'package:video_streaming_ui/pages/account/widgets/profile_section_layout.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

  Widget showNameFields() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: InfoField(
              label: 'First Name',
              value: 'Shreyansh',
              icon: Icons.person,
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: InfoField(
              label: 'Last Name',
              value: 'Singh',
              icon: Icons.person,
            ),
          ),
        ],
      ),
    );
  }

  Widget showContactFields() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: InfoField(
              label: 'Email',
              value: 'shreyanshsinghjee@gmail.com',
              icon: Icons.email,
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            child: InfoField(
              label: 'Phone',
              value: '+91 1234567890',
              icon: Icons.phone,
            ),
          ),
        ],
      ),
    );
  }

  Widget showPersonalInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      child: ProfileSectionLayout(
        type: ProfileSectionType.personalInfo,
        label: 'Personal Information',
        allowEdit: true,
        child: Column(
          children: [
            showNameFields(),
            showContactFields(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return showPersonalInfo();
  }
}
