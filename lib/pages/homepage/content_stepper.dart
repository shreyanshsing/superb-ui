import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';
import 'package:video_streaming_ui/theme/palette.dart';

const data = [
  {
    'label':
        'Enjoy your favourite videos with people from all around the world. '
  },
  {'label': 'Watch your favourite movies and TV shows with your friends.'},
  {'label': 'Chat with your friends while watching your favourite videos.'},
  {'label': 'Create your own room and invite your friends to join.'},
];

class DescriptionStepper extends StatefulWidget {
  const DescriptionStepper({super.key});

  @override
  State<DescriptionStepper> createState() => _DescriptionStepperState();
}

class _DescriptionStepperState extends State<DescriptionStepper> {
  int _currentStep = 0;
  late Timer _timer;

  void increaseStep() {
    setState(() {
      _currentStep++;
    });
  }

  void resetStep() {
    setState(() {
      _currentStep = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentStep == data.length - 1) {
        resetStep();
      } else {
        increaseStep();
      }
    });
  }

  Widget showControls() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < data.length; i++)
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                radius: 5,
                backgroundColor:
                    i == _currentStep ? ColorPalette.primaryColor : Colors.grey,
              ),
            ),
        ],
      ),
    );
  }

  Widget showContent() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: CustomText(
          text: data[_currentStep]['label']!,
          fontSize: Size.large,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth,
      height: screenHeight / 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showContent(),
          showControls(),
        ],
      ),
    );
  }
}
