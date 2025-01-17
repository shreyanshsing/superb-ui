import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_streaming_ui/pages/signup-page/controller/signup_bloc.dart';
import 'package:video_streaming_ui/router/main.dart';
import 'package:video_streaming_ui/router/navigation_service.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/custom_button.dart';
import 'package:video_streaming_ui/shared/Widgets/custom_textfield.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool isLoading = false;
  late NavigationService navigationService;

  @override
  void initState() {
    super.initState();
    navigationService = NavigationService(context);
  }

  get inputVariables => {
        'email': emailController.text,
        'password': passwordController.text,
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
      };

  void routeToAvatarSelectionPage() {
    log('Route to avatar selection page');
    navigationService.push(CustomRouter.chooseAvatar);
  }

  void signup() {
    if (formKey.currentState!.validate()) {
      log('Form is valid');
      log('input variables ---> $inputVariables');
      routeToAvatarSelectionPage();
      // context.read<SignupBloc>().add(SignupUser(variables: inputVariables));
    } else {
      log('Form is invalid');
    }
  }

  void routeToLogin() {
    log('Route to login');
    navigationService.push(CustomRouter.login);
  }

  Widget showWelcomeText() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 50),
      child: CustomText(
        text: 'Sign Up',
        fontSize: Size.extraLarge,
        fontWeight: TextWeight.bold,
      ),
    );
  }

  Widget showEmailField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextField(
        prefixIcon: Icons.email,
        labelText: 'Email',
        controller: emailController,
        focusNode: emailFocusNode,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email is required';
          }
          return null;
        },
        onFieldSubmitted: (value) {
          emailFocusNode.unfocus();
          FocusScope.of(context).requestFocus(firstNameFocusNode);
        },
      ),
    );
  }

  Widget showFirstNameField() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: CustomTextField(
        prefixIcon: Icons.person,
        labelText: 'First Name',
        controller: firstNameController,
        focusNode: firstNameFocusNode,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'First Name is required';
          }
          return null;
        },
        onFieldSubmitted: (value) {
          firstNameFocusNode.unfocus();
          FocusScope.of(context).requestFocus(lastNameFocusNode);
        },
      ),
    );
  }

  Widget showLastNameField() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: CustomTextField(
        prefixIcon: Icons.person,
        labelText: 'Last Name',
        controller: lastNameController,
        focusNode: lastNameFocusNode,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Last Name is required';
          }
          return null;
        },
        onFieldSubmitted: (value) {
          lastNameFocusNode.unfocus();
          FocusScope.of(context).requestFocus(passwordFocusNode);
        },
      ),
    );
  }

  Widget showPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: CustomTextField(
        prefixIcon: Icons.lock,
        labelText: 'Password',
        controller: passwordController,
        focusNode: passwordFocusNode,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password is required';
          }
          return null;
        },
        obscureText: true,
        onFieldSubmitted: (value) {
          passwordFocusNode.unfocus();
          FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
        },
      ),
    );
  }

  Widget showConfirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: CustomTextField(
        prefixIcon: Icons.lock,
        labelText: 'Confirm Password',
        controller: confirmPasswordController,
        focusNode: confirmPasswordFocusNode,
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Confirm Password is required';
          }
          if (value != passwordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        onFieldSubmitted: (value) {
          confirmPasswordFocusNode.unfocus();
          signup();
        },
      ),
    );
  }

  Widget showSignupForm() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showEmailField(),
            showFirstNameField(),
            showLastNameField(),
            showPasswordField(),
            showConfirmPasswordField(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget showAlreadyWithUs() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: 'Already with us?',
            fontWeight: TextWeight.bold,
            color: TextColor.tertiary,
          ),
          CustomButton(
            text: 'Log in',
            onPressed: routeToLogin,
            type: ButtonType.text,
          ),
        ],
      ),
    );
  }

  Widget showCreateAccountButton() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: CustomButton(
        text: 'Create account',
        onPressed: signup,
        isFullWidth: true,
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
            Colors.black,
            Colors.black,
          ],
        ),
      ),
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 10,
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.all(20),
          maintainBottomViewPadding: true,
          child: Column(
            children: [
              showWelcomeText(),
              showSignupForm(),
              showAlreadyWithUs(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, SignupState state) {
    return Scaffold(
      bottomNavigationBar: IntrinsicHeight(
        child: showCreateAccountButton(),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/homepage.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          showContent(),
        ],
      ),
    );
  }

  void _listener(BuildContext context, state) {
    log('state ---> ${state.runtimeType}');
    switch (state.runtimeType) {
      case const (SignupSuccess):
        isLoading = false;
        break;
      case const (SignupFailure):
        isLoading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.error)));
        break;
      case const (SignupLoading):
        isLoading = true;
        break;
    }
    //
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(
      builder: _builder,
      listener: _listener,
    );
  }
}
