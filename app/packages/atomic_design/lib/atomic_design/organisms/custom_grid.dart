import 'package:atomic_design/atomic_design.dart';
import 'package:flutter/widgets.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({
    super.key,
    this.title,
    required this.listItems,
  });

  final List<Widget> listItems;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...(title != null)
            ? [
                CustomText(
                  title ?? "",
                  textStyle: TextStyleEnum.headlineSmall,
                ),
                const SizedBox(height: 8.0),
              ]
            : [
                const SizedBox(),
              ],
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: listItems.length,
            itemBuilder: (context, index) => listItems[index],
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
            ),
          ),
        )
      ],
    );
  }
}
