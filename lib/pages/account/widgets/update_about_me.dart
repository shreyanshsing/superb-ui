import 'package:flutter/material.dart';
import 'package:video_streaming_ui/pages/account/models/personal_info_model.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/custom_button.dart';
import 'package:video_streaming_ui/shared/Widgets/custom_textarea.dart';
import 'package:video_streaming_ui/shared/utils/context_meta_data.dart';

class UpdateAboutMe extends StatefulWidget {
  final PersonalInfoModel personalInfo;
  final Widget child;
  final void Function(PersonalInfoModel)? onSave;

  const UpdateAboutMe({
    super.key,
    required this.personalInfo,
    required this.child,
    this.onSave,
  });

  @override
  _UpdateAboutMe createState() => _UpdateAboutMe();
}

class _UpdateAboutMe extends State<UpdateAboutMe> {
  late ContextMetaData _metaData;
  final TextEditingController _aboutMeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _aboutMeController.dispose();
    super.dispose();
  }

  void handleClose() {
    Navigator.pop(context);
  }

  PreferredSizeWidget showHeader() {
    return AppBar(
      leading: Icon(Icons.info, color: Theme.of(context).primaryColor),
      automaticallyImplyLeading: false,
      title: CustomText(text: 'Update About Me'),
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
            child: CustomTextArea(
              controller: _aboutMeController,
              labelText: 'About Me',
              maxLines: 15,
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
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: CustomButton(
        onPressed: () {},
        text: 'Save',
        isFullWidth: true,
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
