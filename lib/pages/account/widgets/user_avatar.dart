import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:video_streaming_ui/pages/account/widgets/image_picker.dart';

class UserAvatar extends StatefulWidget {
  final bool? isLoading;
  final String? source;

  const UserAvatar({
    super.key,
    this.isLoading = false,
    this.source,
  });

  @override
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  bool? isLoading;
  bool isMenuVisible = false;
  String? image;

  @override
  void initState() {
    super.initState();
    isLoading = widget.isLoading;
  }

  void toggleMenu() {
    setState(() {
      isMenuVisible = !isMenuVisible;
    });
  }

  void onImagePicked(XFile pickedFile) {
    setState(() {
      print('Image picked: ${pickedFile.path}');
      image = pickedFile.path;
    });
  }

  ImageProvider? get _imageProvider {
    if (image != null) {
      return FileImage(File(image!));
    }
    if (widget.source != null) {
      return NetworkImage(widget.source!);
    }
    return const AssetImage('assets/images/user.png');
  }

  void onRemoveImage() {
    setState(() {
      image = null;
      isMenuVisible = false;
    });
  }

  Widget showAvatar() {
    return GestureDetector(
      onTap: toggleMenu,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: _imageProvider!,
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: isMenuVisible ? showProfileMenus() : const SizedBox.shrink(),
      ),
    );
  }

  Widget showProfileMenus() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(150, 0, 0, 0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImagePicker(
            onPress: toggleMenu,
            onImagePicked: onImagePicked,
            child: const Icon(
              Icons.upload,
              size: 30,
            ),
          ),
          const VerticalDivider(
            color: Colors.white,
            thickness: 0.5,
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              size: 30,
            ),
            onPressed: onRemoveImage,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading ?? false,
      child: showAvatar(),
    );
  }
}
