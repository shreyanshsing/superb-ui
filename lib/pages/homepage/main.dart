import 'package:flutter/material.dart';
import 'package:video_streaming_ui/pages/homepage/content_stepper.dart';
import 'package:video_streaming_ui/router/main.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/enum.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/homepage_button.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  void routeToLoginPage(context) {
    Navigator.pushNamed(context, CustomRouter.loginLandingPage);
  }

  Widget showAppImage(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Image.asset(
        'assets/images/homepage.gif',
        width: screenWidth,
        height: screenHeight / 3,
      ),
    );
  }

  Widget showHeading() {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(
            text: 'Welcome to',
            fontSize: SIZE.extraExtraLarge,
            color: COLOR.secondary,
            fontWeight: WEIGHT.regular,
          ),
          CustomText(
            text: 'Superb!',
            fontSize: SIZE.extraExtraLarge,
            color: COLOR.primary,
            fontWeight: WEIGHT.bold,
            letterSpacing: 1.5,
          ),
        ],
      ),
    );
  }

  Widget showContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        showAppImage(context),
        showHeading(),
        DescriptionStepper(),
        Center(
          child: CustomText(
            text: 'Made with ❤️ by Superb',
            fontSize: SIZE.small,
          ),
        ),
      ],
    );
  }

  Widget showContinueButton() {
    return HomepageButton(onComplete: routeToLoginPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: showContent(context),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 90,
        elevation: 10,
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: IntrinsicHeight(
          child: showContinueButton(),
        ),
      ),
    );
  }
}
