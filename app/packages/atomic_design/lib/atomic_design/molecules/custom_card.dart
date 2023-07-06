import 'package:atomic_design/atomic_design.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    this.onTap,
  });

  final String id;
  final String title;
  final ImageProvider image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Hero(
            tag: title,
            child: Card(
              shape: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomImage(
                  image: image,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
