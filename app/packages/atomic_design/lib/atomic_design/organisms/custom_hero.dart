import 'package:atomic_design/atomic_design/molecules/custom_card.dart';
import 'package:flutter/material.dart';

class CustomHero extends StatelessWidget {
  const CustomHero({
    super.key,
    required this.title,
    required this.size,
    required this.imageProvider,
    this.leading,
    this.onTap,
  });

  final String title;
  final Size size;
  final Widget? leading;
  final ImageProvider imageProvider;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final width = size.width * 0.30;
    final height = size.height * 0.15;
    return InkWell(
      onTap: onTap,
      child: Hero(
        tag: title,
        child: CustomCard(
          title: title,
          width: width,
          height: height,
          imageProvider: imageProvider,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
