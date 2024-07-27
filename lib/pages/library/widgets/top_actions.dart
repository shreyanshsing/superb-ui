import 'package:flutter/material.dart';
import 'package:video_streaming_ui/pages/library/widgets/sort_list.dart';
import 'package:video_streaming_ui/shared/Widgets/custom_button.dart';
import 'package:video_streaming_ui/shared/Widgets/enum.dart';

const List<String> sortOptions = ['Recent', 'Recently Added', 'Alphabetical'];

class TopActions extends StatefulWidget {
  const TopActions({super.key});

  @override
  State<TopActions> createState() => _TopActionsState();
}

class _TopActionsState extends State<TopActions> {
  int selected = 0;

  void changeSort(int index) {
    setState(() {
      selected = index;
    });
  }

  void showSortList(BuildContext context) {
    showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext sheetContext) {
        return SortList(
          currentSelectedIndex: selected,
          onSelected: changeSort,
        );
      },
    );
  }

  Widget showSort(BuildContext context) {
    return CustomButton(
      icon: Icons.sort,
      text: sortOptions[selected],
      onPressed: () => showSortList(context),
      type: ButtonType.text,
    );
  }

  Widget showAddIcon() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.grid_view,
        size: 25,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        showSort(context),
        showAddIcon(),
      ],
    );
  }
}
