import 'package:flutter/material.dart';
import 'package:video_streaming_ui/router/main.dart';
import 'package:video_streaming_ui/router/navigation_service.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/custom_button.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';
import 'package:intl/intl.dart';

class SelectUsernameAndDob extends StatefulWidget {
  const SelectUsernameAndDob({super.key});

  @override
  State<SelectUsernameAndDob> createState() => _SelectUsernameAndDobState();
}

class _SelectUsernameAndDobState extends State<SelectUsernameAndDob> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode dobFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late NavigationService navigationService;
  final DateFormat getDateOnly = DateFormat('MM-dd-yyyy');

  @override
  void initState() {
    super.initState();
    navigationService = NavigationService(context);
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      navigationService.push(CustomRouter.selectInterests);
    }
  }

  void showDatePickerDrawer() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        final parsedValue = getDateOnly.format(value);
        dobController.text = parsedValue.toString();
      }
    });
  }

  Widget showUsernameLabel() {
    return CustomText(
      text:
          'Cheeky usernames always catch the eye, so give yourself a good one!',
      color: TextColor.tertiary,
    );
  }

  Widget showDobLabel() {
    return CustomText(
      text:
          'We need your date of birth to make sure you’re old(16+) enough. And remember, you cannot change this later.',
      color: TextColor.tertiary,
    );
  }

  Widget showUsernameTextField() {
    return TextFormField(
      controller: usernameController,
      focusNode: usernameFocus,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        usernameFocus.unfocus();
        FocusScope.of(context).requestFocus(dobFocus);
      },
      decoration: const InputDecoration(
        labelText: 'Username',
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a username';
        }
        return null;
      },
    );
  }

  Widget showDobTextField() {
    return GestureDetector(
      onTap: showDatePickerDrawer,
      child: AbsorbPointer(
        child: TextFormField(
          controller: dobController,
          focusNode: dobFocus,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) {
            dobFocus.unfocus();
            submit();
          },
          decoration: const InputDecoration(
            labelText: 'Date of Birth',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your date of birth';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget showContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            showUsernameLabel(),
            const SizedBox(height: 20),
            showUsernameTextField(),
            const SizedBox(height: 50),
            showDobLabel(),
            const SizedBox(height: 20),
            showDobTextField(),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Next',
              onPressed: submit,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomText(
          text: 'Fill in your details',
          fontSize: Size.large,
          color: TextColor.primary,
        ),
      ),
      body: PopScope(
        canPop: false,
        child: showContent(),
      ),
    );
  }
}
