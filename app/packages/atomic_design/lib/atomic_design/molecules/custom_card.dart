import 'package:atomic_design/atomic_design/atoms/custom_image.dart';
import 'package:atomic_design/atomic_design/atoms/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.title,
    this.borderRadius,
    required this.imageProvider,
    required this.width,
    required this.height,
  });

  final String? title;
  final BorderRadius? borderRadius;
  final double width;
  final double height;
  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Color>(
      future: _getAverageColor(imageProvider),
      builder: (context, snapshot) {
        final averageColor = snapshot.data ?? Colors.white;
        return Container(
          constraints: const BoxConstraints(minHeight: 50.0),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: averageColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(
                width: width,
                height: height,
                imageProvider: imageProvider,
              ),
              (title != null)
                  ? CustomText(
                      title!,
                      maxLines: 2,
                      fontWeight: FontWeight.bold,
                      textStyle: TextStyleEnum.bodyMedium,
                      color: getContrastingColor(averageColor),
                    )
                  : const SizedBox(),
            ],
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

  Color getContrastingColor(Color color) {
    int invertedRed = 255 - color.red;
    int invertedGreen = 255 - color.green;
    int invertedBlue = 255 - color.blue;

    return Color.fromARGB(
        color.alpha, invertedRed, invertedGreen, invertedBlue);
  }
}
