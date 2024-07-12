import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_streaming_ui/router/main.dart';
import 'package:video_streaming_ui/router/navigation_service.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/custom_button.dart';
import 'package:video_streaming_ui/shared/Widgets/custom_textfield.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  late NavigationService navigationService;

  @override
  void initState() {
    super.initState();
    navigationService = NavigationService(context);
  }

  void login() {
    log('Email: ${emailController.text}');
    log('Password: ${passwordController.text}');
    if (formKey.currentState!.validate()) {
      log('Form is valid');
      navigationService.push(CustomRouter.dashboard);
    } else {
      log('Form is invalid');
    }
  }

  void routeToSignUp() {
    log('Route to sign up');
    navigationService.push(CustomRouter.signup);
  }

  Widget showWelcomeText() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: CustomText(
        text: 'Log In',
        fontSize: Size.extraLarge,
        fontWeight: TextWeight.bold,
      ),
    );
  }

  Widget showEmailTextField() {
    return CustomTextField(
      prefixIcon: Icons.email,
      labelText: 'Email',
      obscureText: false,
      controller: emailController,
      onCompleted: (value) {
        emailController.text = value?.trim();
      },
      focusNode: emailFocusNode,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(passwordFocusNode);
      },
    );
  }

  Widget showPasswordTextField() {
    return CustomTextField(
      prefixIcon: Icons.lock,
      labelText: 'Password',
      obscureText: true,
      controller: passwordController,
      onCompleted: (value) {
        passwordController.text = value?.trim();
      },
      focusNode: passwordFocusNode,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      onFieldSubmitted: (value) {
        login();
      },
    );
  }

  Widget showLoginForm() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            showEmailTextField(),
            const SizedBox(height: 20),
            showPasswordTextField(),
            const SizedBox(height: 20),
            CustomButton(
              isFullWidth: true,
              color: ButtonColor.primary,
              text: 'Log In',
              onPressed: login,
            )
          ],
        ),
      ),
    );
  }

  Widget showForgotPassword() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomText(
            text: 'Forgot your password?',
            color: TextColor.tertiary,
          ),
          CustomButton(
            text: 'Reset',
            onPressed: () {},
            color: ButtonColor.tertiary,
            type: ButtonType.text,
          )
        ],
      ),
    );
  }

  Widget showCreateAccountButton() {
    return IntrinsicHeight(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomText(
              text: 'Don\'t have an account?',
              color: TextColor.tertiary,
            ),
            CustomButton(
              text: 'Sign Up',
              onPressed: routeToSignUp,
              color: ButtonColor.primary,
              type: ButtonType.text,
            )
          ],
        ),
      ),
    );
  }

  Widget showContent() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.5),
            Colors.black,
            Colors.black,
          ],
        ),
      ),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(
        vertical: 100,
        horizontal: 20,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            showWelcomeText(),
            showLoginForm(),
            showForgotPassword(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/hero.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          showContent(),
        ],
      ),
      bottomNavigationBar: showCreateAccountButton(),
    );
  }
}
