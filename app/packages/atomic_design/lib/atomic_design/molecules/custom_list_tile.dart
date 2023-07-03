import 'package:atomic_design/atomic_design.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    this.leading,
    this.onTap,
  });

  final String title;
  final Widget? leading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 50.0),
        child: Row(
          children: [
            leading != null ? leading! : const SizedBox(),
            const SizedBox(width: 8.0),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title,
                    maxLines: 2,
                    fontWeight: FontWeight.bold,
                    textStyle: TextStyleEnum.bodyMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
