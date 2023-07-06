import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
  });

  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      fit: BoxFit.cover,
    );
  }
}
