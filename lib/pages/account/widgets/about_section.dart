import 'package:flutter/material.dart';
import 'package:video_streaming_ui/pages/account/widgets/info_field.dart';
import 'package:video_streaming_ui/pages/account/widgets/profile_section_layout.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  Widget showAboutSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      child: const ProfileSectionLayout(
        type: ProfileSectionType.aboutMe,
        label: 'About Me',
        allowEdit: true,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              InfoField(
                label: 'About',
                value:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.',
                icon: Icons.podcasts,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return showAboutSection();
  }
}
