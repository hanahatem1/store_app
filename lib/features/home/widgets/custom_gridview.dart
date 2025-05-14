import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/widgets/custom_gridview_item.dart';

class CustomGridview extends StatelessWidget {
  const CustomGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10,
        childAspectRatio:.75,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return const CustomGridviewItem();
      },
    );
  }
}
