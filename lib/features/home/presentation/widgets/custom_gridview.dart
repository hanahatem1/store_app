import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_gridview_item.dart';

class CustomGridview extends StatelessWidget {
  const CustomGridview({super.key, required this.products});

final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio:.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return  CustomGridviewItem(product: products[index]);
      },
    );
  }
}
