import 'package:app/core/result.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class GetImageProviderAverageColorUseCase {
  Future<Result<Color>> call({
    required ImageProvider imageProvider,
  }) async {
    try {
      final palette = await PaletteGenerator.fromImageProvider(imageProvider);
      final averageColor = palette.dominantColor!.color;
      return Result.success(data: averageColor);
    } on Exception catch (e) {
      return Result.failure(message: e.toString(), exception: e);
    }
  }
}
