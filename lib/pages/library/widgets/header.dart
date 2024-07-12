import 'package:flutter/material.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/pill_text.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart' show TextWeight;
import 'package:video_streaming_ui/shared/utils/context_meta_data.dart';

class LibraryHeader extends StatefulWidget implements PreferredSizeWidget {
  const LibraryHeader({super.key});

  @override
  State<LibraryHeader> createState() => _LibraryHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(150);
}

class _LibraryHeaderState extends State<LibraryHeader> {
  late ContextMetaData contextMetaData;

  @override
  void initState() {
    super.initState();
    contextMetaData = ContextMetaData(context: context);
  }

  Widget showLabel() {
    return CustomText(
      text: 'Your Library',
      fontWeight: TextWeight.bold,
    );
  }

  Widget showSearchIcon() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.search,
        size: 30,
      ),
    );
  }

  Widget showAddIcon() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }

  Widget showActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        showSearchIcon(),
        showAddIcon(),
      ],
    );
  }

  Widget showHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            showLabel(),
            showActions(),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            showTags(),
          ],
        ),
      ],
    );
  }

  Widget showTags() {
    return Row(
      children: [
        PillText(
          text: 'Most Liked',
          pillColor: contextMetaData.getPrimaryColor() ?? Colors.white70,
          textColor: Colors.white,
        ),
        const SizedBox(width: 10),
        PillText(
          text: 'Most Viewed',
          pillColor: contextMetaData.getPrimaryColor() ?? Colors.white70,
          textColor: Colors.white,
        ),
        const SizedBox(width: 10),
        PillText(
          text: 'Playlists',
          pillColor: contextMetaData.getPrimaryColor() ?? Colors.white70,
          textColor: Colors.white,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          border: const Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: showHeader(),
      ),
    );
  }
}
