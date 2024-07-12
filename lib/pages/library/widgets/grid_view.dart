import 'package:flutter/material.dart';
import 'package:video_streaming_ui/pages/library/widgets/playlist_tile.dart';

class LibraryGridView extends StatefulWidget {
  const LibraryGridView({super.key});

  @override
  State<LibraryGridView> createState() => _LibraryGridViewState();
}

const List<Map<String, dynamic>> data = <Map<String, dynamic>>[
  {
    'id': '1',
    'title': 'The Best of 2021',
    'type': 'playlist',
    'thumbnail':
        'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'videoCount': 10,
    'isPinned': true,
  },
];

class _LibraryGridViewState extends State<LibraryGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.5,
      ),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(10),
          child: PlaylistTile(
            id: data[index]['id'] as String,
            title: data[index]['title'] as String,
            type: data[index]['type'] as String,
            thumbnail: data[index]['thumbnail'] as String?,
            videoCount: data[index]['videoCount'] as int?,
            isPinned: data[index]['isPinned'] as bool?,
          ),
        );
      },
    );
  }
}
