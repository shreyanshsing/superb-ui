import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';

enum ImagePickerType {
  camera,
  gallery,
}

const pickerOptions = [
  {
    'icon': Icons.camera_alt,
    'label': 'Camera',
    'type': ImagePickerType.camera,
  },
  {
    'icon': Icons.photo_library,
    'label': 'Gallery',
    'type': ImagePickerType.gallery,
  },
];

class CustomImagePicker extends StatelessWidget {
  final Widget child;
  final Function(XFile) onImagePicked;
  final Function? onPress;

  const CustomImagePicker({
    super.key,
    required this.child,
    required this.onImagePicked,
    this.onPress,
  });

  Future<bool> mediaPermission() async {
    const Permission mediaLibraryPermission = Permission.mediaLibrary;
    const Permission photosPermission = Permission.photos;
    final PermissionStatus mediaLibraryPermissionStatus =
        await mediaLibraryPermission.status;
    final PermissionStatus photosPermissionStatus =
        await photosPermission.status;

    if (mediaLibraryPermissionStatus.isGranted ||
        photosPermissionStatus.isGranted) {
      return true;
    }
    final Map<Permission, PermissionStatus> statuses = await [
      mediaLibraryPermission,
      photosPermission,
    ].request();

    return statuses[mediaLibraryPermission]!.isGranted ||
        statuses[photosPermission]!.isGranted;
  }

  Future<bool> cameraPermission() async {
    const Permission cameraPermission = Permission.camera;
    final PermissionStatus cameraPermissionStatus =
        await cameraPermission.status;
    if (cameraPermissionStatus.isGranted) {
      return true;
    }
    final PermissionStatus status = await cameraPermission.request();
    return status.isGranted;
  }

  Future<void> showImagePicker(ImagePickerType type) async {
    bool hasPermission = false;
    if (type == ImagePickerType.camera) {
      hasPermission = await cameraPermission();
    } else {
      hasPermission = await mediaPermission();
    }
    if (!hasPermission) {
      return;
    }
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: type == ImagePickerType.camera
          ? ImageSource.camera
          : ImageSource.gallery,
    );
    if (pickedFile != null) {
      onImagePicked(pickedFile);
    }
  }

  void handleOptions(BuildContext context, ImagePickerType type) {
    showImagePicker(type);
    Navigator.of(context).pop();
  }

  Widget showListTile(BuildContext context, Map<String, dynamic> option) {
    return ListTile(
      style: ListTileStyle.list,
      tileColor: Colors.black38,
      leading: Icon(
        option['icon'] as IconData,
        color: Theme.of(context).primaryColor,
        size: 30,
      ),
      title: CustomText(
        text: option['label'] as String,
        fontSize: Size.large,
        fontWeight: TextWeight.light,
      ),
      onTap: () {
        handleOptions(context, option['type'] as ImagePickerType);
      },
    );
  }

  Widget showPickerOptions() {
    return Material(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pickerOptions.length,
        itemBuilder: (context, index) {
          final option = pickerOptions[index];
          return showListTile(context, option);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 0,
            thickness: 0.5,
          );
        },
      ),
    );
  }

  Widget showHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: 'Choose an option',
          fontSize: Size.large,
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  void showOptionsModal(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.25;
    showAdaptiveDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return IntrinsicHeight(
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              height: height,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  showHeader(dialogContext),
                  const SizedBox(height: 20),
                  showPickerOptions(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress?.call();
        showOptionsModal(context);
      },
      child: child,
    );
  }
}
