import 'package:flutter/material.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';
import 'package:video_streaming_ui/shared/utils/context_meta_data.dart';
import 'package:video_streaming_ui/theme/palette.dart';

enum PostType {
  video,
  playlist,
}

class PlaylistTile extends StatelessWidget {
  final String id;
  final String title;
  final String type;
  final String? thumbnail;
  final int? videoCount;
  final bool? isPinned;
  late ContextMetaData contextMetaData;

  bool get isPostPinned => isPinned ?? false;

  PlaylistTile(
      {super.key,
      required this.id,
      required this.title,
      required this.type,
      this.thumbnail,
      this.videoCount,
      this.isPinned});

  Widget showTitle(BuildContext context) {
    contextMetaData = ContextMetaData(context: context)..init();
    return IntrinsicWidth(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CustomText(
              text: title,
              color: TextColor.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget showPostType() {
    if (type == PostType.video.name) {
      return CustomText(
        text: 'Video',
        color: TextColor.tertiary,
        fontSize: Size.small,
      );
    }
    return CustomText(
      text: 'Playlist',
      color: TextColor.tertiary,
      fontSize: Size.small,
    );
  }

  Widget showPinIcon(BuildContext context) {
    contextMetaData = ContextMetaData(context: context)..init();
    return Container(
      height: 30,
      padding: const EdgeInsets.all(5.0),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0),
          ],
        ),
      ),
      child: const Icon(
        Icons.push_pin,
        color: ColorPalette.primaryColor,
      ),
    );
  }

  Widget showVideoCount() {
    return Positioned(
      bottom: 0,
      right: 0,
      width: 110,
      child: Container(
        alignment: Alignment.bottomRight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0.3),
            ],
          ),
        ),
        padding: const EdgeInsets.all(5.0),
        child: CustomText(
          text: '$videoCount ${String.fromCharCode(0x1F3AC)}',
          color: TextColor.secondary,
          fontSize: Size.small,
        ),
      ),
    );
  }

  Widget showTextThumbnail() {
    return CustomText(
      text: title.substring(0, 2).toUpperCase(),
      color: TextColor.secondary,
      fontSize: Size.extraExtraLarge,
      fontWeight: TextWeight.bold,
    );
  }

  Widget showImageThumbnail() {
    return Image.network(
      thumbnail!,
      fit: BoxFit.cover,
      width: 110,
      height: 110,
    );
  }

  Widget getThumbnail() {
    if (thumbnail == null) {
      return showTextThumbnail();
    }
    return showImageThumbnail();
  }

  Widget showThumbnail(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          getThumbnail(),
          if (isPostPinned) showPinIcon(context),
          if (type == PostType.playlist.name) showVideoCount(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          showThumbnail(context),
          const SizedBox(height: 10),
          showTitle(context),
          const SizedBox(height: 5),
          showPostType(),
        ],
      ),
    );
  }
}
