import 'package:flutter/material.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';

class WelcomeHeading extends StatelessWidget {
  const WelcomeHeading({super.key});

  Widget showContent() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomText(
            text: 'Welcome to',
          ),
          CustomText(
            text: 'Superb!',
            fontSize: Size.custom,
            color: TextColor.highlight,
            fontWeight: TextWeight.bold,
            letterSpacing: 1.5,
            customFontSize: 40.0,
          ),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return showContent();
  }
}
