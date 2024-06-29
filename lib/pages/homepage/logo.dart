import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/enum.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';

class AnimatedAppLogo extends StatefulWidget {
  const AnimatedAppLogo({super.key});

  @override
  AnimatedAppLogoState createState() => AnimatedAppLogoState();
}

class AnimatedAppLogoState extends State<AnimatedAppLogo>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _animations;
  late AnimationController _exclamationController;
  late Animation<Offset> _exclamationAnimation;

  @override
  void initState() {
    super.initState();
    _animationControllers = List.generate(
        7,
        (index) => AnimationController(
              vsync: this,
              duration: const Duration(
                microseconds: 500,
              ),
            ));
    _animations = _animationControllers
      ..map((controller) {
        return CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        );
      }).toList();
    _exclamationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 100),
    );
    _exclamationAnimation = Tween<Offset>(
      begin: const Offset(
        0,
        -1,
      ),
      end: const Offset(
        0,
        0,
      ),
    ).animate(
      CurvedAnimation(
        parent: _exclamationController,
        curve: Curves.bounceOut,
      ),
    );
    _startAnimation();
  }

  void _startAnimation() async {
    for (int i = 0; i < _animationControllers.length - 1; i++) {
      await Future.delayed(
        const Duration(milliseconds: 100),
        () {
          _animationControllers[i].forward();
        },
      );
    }
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        _exclamationController.forward();
      },
    );
  }

  @override
  void dispose() {
    for (final controller in _animationControllers) {
      controller.dispose();
    }
    _exclamationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < _animations.length - 1; i++,)
          FadeTransition(
            opacity: _animations[i],
            child: CustomText(
              text: 'Superb'[i],
              fontSize: SIZE.custom,
              color: COLOR.primary,
              fontWeight: WEIGHT.bold,
              letterSpacing: 2,
              customFontSize: 50.0,
            ),
          ),
        Transform.rotate(
          angle: pi / 4, // 45 degree rotation
          child: SlideTransition(
            position: _exclamationAnimation,
            child: Container(
              margin: const EdgeInsets.only(
                left: 10.0,
              ),
              child: CustomText(
                text: '!',
                fontSize: SIZE.extraLarge,
                color: COLOR.primary,
                fontWeight: WEIGHT.bold,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
