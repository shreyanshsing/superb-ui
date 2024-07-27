import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    required this.image,
    this.isNetworkImage = false,
    this.radius = 5,
  });

  final String image;
  final double radius;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: isNetworkImage
          ? NetworkImage(image)
          : AssetImage(image) as ImageProvider<Object>?,
    );
  }
}
