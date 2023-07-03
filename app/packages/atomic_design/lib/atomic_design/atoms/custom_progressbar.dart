import 'package:flutter/material.dart';

class CustomProgressbar extends StatelessWidget {
  const CustomProgressbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.amber,
      ),
    );
  }
}
