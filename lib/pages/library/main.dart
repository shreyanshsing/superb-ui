import 'package:flutter/material.dart';
import 'package:video_streaming_ui/pages/library/widgets/grid_view.dart';
import 'package:video_streaming_ui/pages/library/widgets/header.dart';
import 'package:video_streaming_ui/pages/library/widgets/top_actions.dart';
import 'package:video_streaming_ui/shared/Widgets/bottom_nav.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  Widget showBody() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TopActions(),
            SizedBox(height: 20),
            LibraryGridView(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LibraryHeader(),
      body: showBody(),
      bottomNavigationBar: const BottomNav(currentIndex: 2),
    );
  }
}
