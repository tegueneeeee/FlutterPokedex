import 'package:atomic_design/atomic_design/atoms/custom_image.dart';
import 'package:atomic_design/atomic_design/atoms/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
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
    return FutureBuilder<Color>(
      future: _getAverageColor(imageProvider),
      builder: (context, snapshot) {
        final averageColor = snapshot.data ?? Colors.white;
        return InkWell(
          onTap: onTap,
          child: Container(
            constraints: const BoxConstraints(minHeight: 50.0),
            decoration: BoxDecoration(
              color: averageColor,
              border: Border.all(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImage(
                        width: width,
                        height: height,
                        imageProvider: imageProvider,
                      ),
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
      },
    );
  }

  Future<Color> _getAverageColor(ImageProvider imageProvider) async {
    final palette = await PaletteGenerator.fromImageProvider(imageProvider);
    final averageColor = palette.dominantColor!.color;
    return averageColor;
  }
}
