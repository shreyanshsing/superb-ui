import 'package:flutter/material.dart';
import 'package:video_streaming_ui/theme/palette.dart';

class HomepageButton extends StatefulWidget {
  final Function onComplete;
  const HomepageButton({super.key, required this.onComplete});

  @override
  State<HomepageButton> createState() => _HomepageButtonState();
}

class _HomepageButtonState extends State<HomepageButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double _dragPosition = 30;
  double _rowWidth = 0;

  @override
  void initState() {
    super.initState();
    _rowWidth = 0;
    _dragPosition = 30;
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget letsGoText(double rowWidth) {
    return Draggable(
      axis: Axis.horizontal,
      feedback: letsGoTextContent(rowWidth),
      childWhenDragging: Container(),
      onDragUpdate: (details) {
        final newPosition = _dragPosition + details.delta.dx;
        if (newPosition >= rowWidth - 120) {
          widget.onComplete.call();
          return;
        }
        if (newPosition >= 30 && newPosition <= rowWidth - 100) {
          _controller.value = newPosition / rowWidth;
          setState(() {
            _dragPosition = newPosition;
          });
        }
      },
      child: letsGoTextContent(rowWidth),
    );
  }

  Widget letsGoTextContent(double rowWidth) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(35.0),
          bottomRight: Radius.circular(35.0),
        ),
      ),
      child: Row(
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: ColorPalette.primaryColor,
                fontFamily: 'Rock3D',
              ),
              children: [
                TextSpan(
                  text: 'Let\'s  \n',
                ),
                TextSpan(
                  text: ' Go! ',
                ),
              ],
            ),
          ),
          AnimatedIcon(
            size: 25.0,
            color: ColorPalette.primaryColor,
            icon: AnimatedIcons.pause_play,
            progress: _controller,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              ColorPalette.primaryColor,
              Colors.transparent,
            ],
            stops: [_dragPosition / _rowWidth, _dragPosition / _rowWidth],
          ),
          borderRadius: BorderRadius.circular(35.0),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            _rowWidth = constraints.maxWidth;
            return Stack(
              children: [
                Positioned(
                  left: _dragPosition - 5,
                  child: letsGoText(constraints.maxWidth),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
