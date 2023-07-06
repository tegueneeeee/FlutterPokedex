import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({
    super.key,
    required this.listItems,
  });

  final List<Widget> listItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      itemCount: listItems.length,
      itemBuilder: (context, index) => listItems[index],
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
    );
  }
}
