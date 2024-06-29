import 'package:flutter/material.dart';
import 'package:video_streaming_ui/pages/account/models/personal_info_model.dart';
import 'package:video_streaming_ui/pages/account/widgets/update_about_me.dart';
import 'package:video_streaming_ui/pages/account/widgets/update_personal_info.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/enum.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';

enum ProfileSectionType {
  personalInfo,
  aboutMe,
}

class ProfileSectionLayout extends StatelessWidget {
  const ProfileSectionLayout({
    super.key,
    required this.label,
    required this.child,
    required this.type,
    this.onEdit,
    this.allowEdit = false,
  });

  final String label;
  final Widget child;
  final bool allowEdit;
  final void Function(PersonalInfoModel)? onEdit;
  final ProfileSectionType type;

  Widget showLabel() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: CustomText(
        text: label,
        fontSize: SIZE.small,
        fontWeight: WEIGHT.medium,
      ),
    );
  }

  Widget updateInfo(BuildContext context) {
    if (type == ProfileSectionType.personalInfo) {
      return UpdatePersonalInfo(
        personalInfo: mockPersonalInfo,
        onSave: onEdit,
        child: showEditButton(context),
      );
    }
    return UpdateAboutMe(
      personalInfo: mockPersonalInfo,
      onSave: onEdit,
      child: showEditButton(context),
    );
  }

  Widget showEditButton(BuildContext context) {
    return IconButton.outlined(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
      disabledColor: Theme.of(context).primaryColor,
      icon: const Icon(Icons.edit),
      onPressed: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: child,
        ),
        Positioned(
          left: 10,
          top: 10,
          child: showLabel(),
        ),
        if (allowEdit)
          Positioned(
            right: 0,
            top: 0,
            child: updateInfo(context),
          ),
      ],
    );
  }
}
