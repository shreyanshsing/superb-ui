import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  final BorderRadius? borderRadius;
  final Color? color;
  final double? radius;
  final bool? isNetworkImage;

  const AppImage({
    super.key,
    required this.imageUrl,
    this.height = 100,
    this.width = 100,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    this.color,
    this.radius,
    this.isNetworkImage = false,
  });

  bool get _isNetworkImage => isNetworkImage ?? false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0),
      child: _isNetworkImage
          ? Image.network(
              imageUrl,
              height: height,
              width: width,
              fit: BoxFit.cover,
              color: color,
            )
          : Image.asset(
              imageUrl,
              height: height,
              width: width,
              fit: BoxFit.cover,
              color: color,
            ),
    );
  }
}
