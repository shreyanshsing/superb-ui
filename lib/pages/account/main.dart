import 'package:flutter/material.dart';
import 'package:video_streaming_ui/pages/account/widgets/about_section.dart';
import 'package:video_streaming_ui/pages/account/widgets/personal_info_section.dart';
import 'package:video_streaming_ui/pages/account/widgets/user_avatar.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/enum.dart';
import 'package:video_streaming_ui/shared/Widgets/bottom_nav.dart';
import 'package:video_streaming_ui/shared/Widgets/custom_button.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Widget showUserAvatar() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: const Column(
        children: [
          UserAvatar(),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget showDeleteAccount() {
    return CustomButton(
      icon: Icons.delete,
      type: BUTTON_TYPE.text,
      text: 'Delete Account',
      textColor: COLOR.red,
      onPressed: () {},
    );
  }

  Widget showLogoutButton() {
    return CustomButton(
      icon: Icons.logout,
      type: BUTTON_TYPE.text,
      text: 'Logout',
      onPressed: () {},
    );
  }

  Widget showTermsAndConditions() {
    return CustomButton(
      icon: Icons.info,
      type: BUTTON_TYPE.text,
      text: 'Terms and Conditions',
      onPressed: () {},
    );
  }

  Widget showActionsList() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showDeleteAccount(),
          showLogoutButton(),
          showTermsAndConditions(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showUserAvatar(),
              const PersonalInfoSection(),
              const AboutSection(),
              showActionsList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: 3,
      ),
    );
  }
}
