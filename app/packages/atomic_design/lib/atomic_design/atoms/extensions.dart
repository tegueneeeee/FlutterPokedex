import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

extension ImageProviderExt on ImageProvider {
  Future<Color> average() async {
    final palette = await PaletteGenerator.fromImageProvider(this);
    final averageColor = palette.dominantColor!.color;
    return averageColor;
  }
}


  // Future<Color> _getAverageColor(ImageProvider imageProvider) async {
  //   final palette = await PaletteGenerator.fromImageProvider(imageProvider);
  //   final averageColor = palette.dominantColor!.color;
  //   return averageColor;
  // }