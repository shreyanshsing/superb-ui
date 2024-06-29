import 'package:flutter/material.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/enum.dart';
import 'package:video_streaming_ui/shared/Widgets/CustomText/main.dart';

const List<String> sortOptions = ['Recents', 'Recently Added', 'Alphabetical'];

class SortList extends StatefulWidget {
  final int currentSelectedIndex;
  final Function(int) onSelected;

  const SortList({
    super.key,
    required this.currentSelectedIndex,
    required this.onSelected,
  });

  @override
  State<SortList> createState() => _SortListState();
}

class _SortListState extends State<SortList> {
  int selected = 0;

  @override
  void initState() {
    super.initState();
    selected = widget.currentSelectedIndex;
  }

  void handleChange(int index) {
    widget.onSelected(index);
    Navigator.pop(context);
  }

  Widget showDragLine() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 50,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget showLabel() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: CustomText(
        text: 'Sort By',
        fontSize: SIZE.large,
        fontWeight: WEIGHT.bold,
      ),
    );
  }

  Widget showListTile(String text, int index) {
    return ListTile(
      leading: Icon(
        selected == index ? Icons.check : Icons.circle_outlined,
        color: selected == index ? Colors.blue : Colors.grey,
      ),
      title: CustomText(
        text: text,
        fontWeight: selected == index ? WEIGHT.bold : WEIGHT.regular,
      ),
      onTap: () => handleChange(index),
    );
  }

  Widget showList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: sortOptions.length,
      itemBuilder: (context, index) {
        return showListTile(sortOptions[index], index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        showDragLine(),
        showLabel(),
        showList(),
      ],
    );
  }
}
