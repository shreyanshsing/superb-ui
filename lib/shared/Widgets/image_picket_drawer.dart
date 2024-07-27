import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';
import 'package:video_streaming_ui/shared/Widgets/snackbar.dart';
import 'package:video_streaming_ui/theme/palette.dart';

enum ImagePickerType {
  camera,
  gallery,
}

class ImagePicketDrawer extends StatefulWidget {
  const ImagePicketDrawer({super.key, required this.handleImage});
  final Function(XFile) handleImage;

  @override
  State<ImagePicketDrawer> createState() => _ImagePicketDrawerState();
}

class _ImagePicketDrawerState extends State<ImagePicketDrawer> {
  @override
  void initState() {
    super.initState();
  }

  Future<bool> checkGalleryPermission() async {
    const Permission mediaLibraryPermission = Permission.mediaLibrary;
    const Permission photosPermission = Permission.photos;
    final PermissionStatus mediaLibraryPermissionStatus =
        await mediaLibraryPermission.status;
    final PermissionStatus photosPermissionStatus =
        await photosPermission.status;

    log('mediaLibraryPermissionStatus: $mediaLibraryPermissionStatus');
    log('photosPermissionStatus: $photosPermissionStatus');

    if (mediaLibraryPermissionStatus.isGranted ||
        photosPermissionStatus.isGranted) {
      return true;
    }

    final Map<Permission, PermissionStatus> statuses = await [
      mediaLibraryPermission,
      photosPermission,
    ].request();

    log('statuses: $statuses');

    return statuses[mediaLibraryPermission]!.isGranted ||
        statuses[photosPermission]!.isGranted;
  }

  Future<bool> checkCameraPermission() async {
    const Permission cameraPermission = Permission.camera;
    final PermissionStatus cameraPermissionStatus =
        await cameraPermission.status;

    if (cameraPermissionStatus.isGranted) {
      return true;
    }

    final Map<Permission, PermissionStatus> statuses =
        await [cameraPermission].request();

    return statuses[cameraPermission]!.isGranted;
  }

  void showImagePicker(ImagePickerType type) async {
    bool hasPermission = false;
    if (type == ImagePickerType.camera) {
      hasPermission = await checkCameraPermission();
    } else {
      hasPermission = await checkGalleryPermission();
    }
    log('hasPermission: $hasPermission');
    if (!hasPermission) {
      CustomSnackbar(
          message:
              'Please give permission to access ${type == ImagePickerType.camera ? 'camera' : 'gallery'}');
      return;
    }
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: type == ImagePickerType.camera
          ? ImageSource.camera
          : ImageSource.gallery,
    );
    if (pickedFile != null) {
      widget.handleImage(pickedFile);
    }
  }

  void handlePicker(ImagePickerType type) {
    log('handlePicker: $type');
    showImagePicker(type);
  }

  Widget showDragLine() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 50,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget showLabel() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: CustomText(
        text: 'Choose source',
        fontSize: Size.large,
        fontWeight: TextWeight.bold,
      ),
    );
  }

  List<Widget> showListTile() {
    return [
      ListTile(
        leading: const Icon(Icons.photo, color: ColorPalette.primaryColor),
        title: CustomText(text: 'Gallery', fontSize: Size.medium),
        onTap: () => handlePicker(ImagePickerType.gallery),
      ),
      ListTile(
        leading: const Icon(Icons.camera_alt, color: ColorPalette.primaryColor),
        title: CustomText(text: 'Camera', fontSize: Size.medium),
        onTap: () => handlePicker(ImagePickerType.camera),
      ),
    ];
  }

  Widget showList() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: showListTile(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        showDragLine(),
        showLabel(),
        showList(),
      ],
    );
  }
}
