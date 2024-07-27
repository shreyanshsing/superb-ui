import 'package:flutter/material.dart';
import 'package:video_streaming_ui/pages/homepage/content_stepper.dart';
import 'package:video_streaming_ui/router/main.dart';
import 'package:video_streaming_ui/router/navigation_service.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';
import 'package:video_streaming_ui/shared/Widgets/homepage_button.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  NavigationService _navigationService(BuildContext context) {
    return NavigationService(context);
  }

  void routeToLoginPage(context) {
    _navigationService(context).push(CustomRouter.login);
  }

  Widget showAppImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.3,
          repeat: ImageRepeat.repeat,
          image: AssetImage('assets/images/homepage.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

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
          const DescriptionStepper(),
        ],
      ),
    );
  }

  Widget showBody() {
    return Stack(
      children: [
        showAppImage(),
        showContent(),
      ],
    );
  }

  Widget showContinueButton(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      child: HomepageButton(
        onComplete: () => routeToLoginPage(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: showBody(),
      bottomNavigationBar: showContinueButton(context),
    );
  }
}
