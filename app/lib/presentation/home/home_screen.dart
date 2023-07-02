import 'package:atomic_design/atomic_design.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          "FlutterPokédex",
          textStyle: TextStyleEnum.headlineMedium,
        ),
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
