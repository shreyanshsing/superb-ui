import 'package:flutter/material.dart';
import 'package:video_streaming_ui/pages/account/models/personal_info_model.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/enum.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/custom_button.dart';
import 'package:video_streaming_ui/shared/Widgets/custom_textfield.dart';
import 'package:video_streaming_ui/shared/utils/context_meta_data.dart';

class UpdatePersonalInfo extends StatefulWidget {
  final PersonalInfoModel personalInfo;
  final Widget child;
  final void Function(PersonalInfoModel)? onSave;

  const UpdatePersonalInfo({
    super.key,
    required this.personalInfo,
    required this.child,
    this.onSave,
  });

  @override
  _UpdatePersonalInfoState createState() => _UpdatePersonalInfoState();
}

class _UpdatePersonalInfoState extends State<UpdatePersonalInfo> {
  late ContextMetaData _metaData;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void handleClose() {
    Navigator.pop(context);
  }

  PreferredSizeWidget showHeader() {
    return AppBar(
      leading: Icon(Icons.info, color: Theme.of(context).primaryColor),
      automaticallyImplyLeading: false,
      title: CustomText(text: 'Update Personal Information'),
      actions: [
        showCancelButton(),
      ],
    );
  }

  Widget showFirstName() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: CustomTextField(
              prefixIcon: Icons.person,
              controller: _firstNameController,
              labelText: 'First Name',
            ),
          ),
        ],
      ),
    );
  }

  Widget showLastName() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: CustomTextField(
              prefixIcon: Icons.person,
              controller: _lastNameController,
              labelText: 'Last Name',
            ),
          ),
        ],
      ),
    );
  }

  Widget showEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: CustomTextField(
              prefixIcon: Icons.email,
              controller: _emailController,
              labelText: 'Email',
            ),
          ),
        ],
      ),
    );
  }

  Widget showPhoneNumber() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: CustomTextField(
              prefixIcon: Icons.phone,
              controller: _phoneController,
              labelText: 'Phone',
            ),
          ),
        ],
      ),
    );
  }

  Widget showContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            showFirstName(),
            showLastName(),
            showEmail(),
            showPhoneNumber(),
          ],
        ),
      ),
    );
  }

  Widget showCancelButton() {
    return IconButton(
      onPressed: handleClose,
      icon: const Icon(Icons.close),
    );
  }

  Widget showBottomAction() {
    return Container(
      decoration: BoxDecoration(
        color: _metaData.getBackgroundColor(),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              color: COLOR.primary,
              onPressed: () {},
              text: 'Save',
            ),
          ),
        ],
      ),
    );
  }

  void showModal() {
    double height = _metaData.getHeight(0.6);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: height,
          child: Scaffold(
            appBar: showHeader(),
            body: showContent(),
            bottomNavigationBar: showBottomAction(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _metaData = ContextMetaData(context: context)..init();
    return GestureDetector(
      onTap: showModal,
      child: widget.child,
    );
  }
}
