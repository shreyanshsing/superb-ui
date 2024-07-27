import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_streaming_ui/pages/signup-page/utils/data.dart';
import 'package:video_streaming_ui/router/main.dart';
import 'package:video_streaming_ui/router/navigation_service.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/app_avatar.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';
import 'package:video_streaming_ui/shared/Widgets/image_picket_drawer.dart';
import 'package:video_streaming_ui/theme/palette.dart';

class ChooseAvatar extends StatefulWidget {
  const ChooseAvatar({super.key});

  @override
  State<ChooseAvatar> createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> {
  int selectedIndex = -1;
  late NavigationService navigationService;
  String? image;

  @override
  void initState() {
    super.initState();
    navigationService = NavigationService(context);
  }

  void setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
      image = null;
    });
  }

  void setCustomAvatar(XFile image) {
    navigationService.pop();
    setState(() {
      selectedIndex = -1;
      this.image = image.path;
    });
  }

  void showImagePicker() {
    setState(() {
      selectedIndex = -1;
    });
    showModalBottomSheet(
      context: context,
      builder: (BuildContext sheetContext) {
        return ImagePicketDrawer(handleImage: setCustomAvatar);
      },
    );
  }

  void handleNext() {
    navigationService.push(CustomRouter.chooseUsernameAndDOB);
  }

  Border showSelectedAvatarBorder() {
    return Border.all(
      color: ColorPalette.selectedAvatarBorderColor,
      width: 2,
    );
  }

  Widget showAvatarPlaceholder() {
    return GestureDetector(
      onTap: showImagePicker,
      child: Container(
        alignment: image != null ? null : Alignment.center,
        padding: image != null ? const EdgeInsets.all(8.0) : null,
        decoration: BoxDecoration(
          border: image != null
              ? Border.all(
                  color: ColorPalette.selectedAvatarBorderColor,
                  width: 2,
                )
              : Border.all(
                  color: ColorPalette.primaryColor,
                  width: 2,
                ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: image != null
            ? AppAvatar(
                image: image!,
                radius: 10,
              )
            : CustomText(
                text: 'Upload your own',
                fontSize: Size.small,
                color: TextColor.primary,
              ),
      ),
    );
  }

  Widget showSubheading() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: CustomText(
        text:
            'It always build a good impression to have a profile picture. So choose from one of the avatars below or upload your own.',
        fontSize: Size.small,
        color: TextColor.tertiary,
      ),
    );
  }

  Widget showSampleAvatars() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: sampleAppImages.length,
      itemBuilder: (BuildContext context, int index) {
        final Map<String, String> avatar = sampleAppImages[index];
        if (avatar['key'] == 'placeholder') {
          return showAvatarPlaceholder();
        }
        return GestureDetector(
          onTap: () => setSelectedIndex(index),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border:
                  selectedIndex == index ? showSelectedAvatarBorder() : null,
              borderRadius: BorderRadius.circular(100),
            ),
            child: AppAvatar(
              image: avatar['image']!,
              radius: 10,
            ),
          ),
        );
      },
    );
  }

  Widget showNextButton() {
    return IconButton.outlined(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      iconSize: 50,
      icon: const Icon(Icons.arrow_forward),
      onPressed: handleNext,
    );
  }

  Widget showContent() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText(
          text: 'Choose an Avatar',
          fontSize: Size.medium,
          color: TextColor.primary,
        ),
      ),
      body: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showSubheading(),
              showSampleAvatars(),
              showNextButton(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: showContent(),
    );
  }
}
