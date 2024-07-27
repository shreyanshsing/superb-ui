import 'package:flutter/material.dart';
import 'package:video_streaming_ui/pages/signup-page/utils/data.dart';
import 'package:video_streaming_ui/router/main.dart';
import 'package:video_streaming_ui/router/navigation_service.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';
import 'package:video_streaming_ui/shared/Widgets/custom_button.dart';
import 'package:video_streaming_ui/shared/Widgets/custom_textfield.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';
import 'package:video_streaming_ui/theme/palette.dart';

class SelectInterests extends StatefulWidget {
  const SelectInterests({super.key});

  @override
  State<SelectInterests> createState() => _SelectInterestsState();
}

class _SelectInterestsState extends State<SelectInterests> {
  TextEditingController searchController = TextEditingController();
  bool showAll = false;
  List<String> selectedKeys = [];
  late NavigationService navigationService;
  List<Map<String, String>> get selectedShows =>
      shows.where((show) => selectedKeys.contains(show['key'])).toList();

  List<Map<String, String>> get filteredShows {
    return shows.where((show) => !selectedKeys.contains(show['key'])).toList();
  }

  @override
  void initState() {
    super.initState();
    navigationService = NavigationService(context);
  }

  void toggleShowAll() {
    setState(() {
      showAll = !showAll;
    });
  }

  void toggleSelected(String key) {
    setState(() {
      final index = selectedKeys.indexOf(key);
      if (index == -1) {
        if (selectedKeys.length >= 50) {
          selectedKeys.remove(selectedKeys.first);
        }
        selectedKeys.add(key);
      } else {
        selectedKeys.removeAt(index);
      }
    });
  }

  void routeToDashboard() {
    navigationService.replace(CustomRouter.dashboard);
  }

  Widget showHeading() {
    return CustomText(
      text: 'Select your interests',
      fontSize: Size.large,
    );
  }

  Widget showHelperText() {
    return CustomText(
      text:
          'Select at least 5 interests to get started, maximum you can select up to 50, your feed and community will be based on your interests',
      color: TextColor.tertiary,
      fontSize: Size.small,
    );
  }

  Widget unselectedPill(Map<String, String> show) {
    return GestureDetector(
      onTap: () => toggleSelected(show['key']!),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: ColorPalette.primaryColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomText(
          text: show['name']!,
          color: TextColor.primary,
          fontSize: Size.small,
        ),
      ),
    );
  }

  Widget selectedPill(Map<String, String> show) {
    return GestureDetector(
      onTap: () => toggleSelected(show['key']!),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: ColorPalette.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomText(
          text: show['name']!,
          fontSize: Size.small,
        ),
      ),
    );
  }

  Widget showSearchbar() {
    return CustomTextField(
      labelText: 'Search for shows',
      prefixIcon: Icons.search,
      controller: searchController,
    );
  }

  Widget showUnselectedPills() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: filteredShows
          .getRange(0, showAll ? shows.length : 30)
          .map((show) => unselectedPill(show))
          .toList(),
    );
  }

  Widget showSelectedPills() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: selectedShows.map((show) {
        return selectedPill(show);
      }).toList(),
    );
  }

  Widget showMoreAndLess() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: toggleShowAll,
          child: CustomText(
            text: showAll ? 'Show less' : 'Show All',
            color: TextColor.highlight,
          ),
        ),
      ],
    );
  }

  Widget showNextButton() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
      decoration: BoxDecoration(
        color: ColorPalette.backgroundColor,
        border: Border.all(color: ColorPalette.backgroundColor),
      ),
      child: CustomButton(
        text: 'Next',
        onPressed: routeToDashboard,
        color: ButtonColor.primary,
        isFullWidth: true,
      ),
    );
  }

  Widget showContent() {
    return Scaffold(
      appBar: AppBar(
        title: showHeading(),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showHelperText(),
              const SizedBox(height: 20),
              showSearchbar(),
              const SizedBox(height: 20),
              showSelectedPills(),
              const SizedBox(height: 30),
              showUnselectedPills(),
              showMoreAndLess(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: showNextButton(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: showContent(),
    );
  }
}
