import 'package:flutter/material.dart';
import 'package:shopping_app/features/details/presentation/widgets/button_details.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

class DetailsBottomBar extends StatelessWidget {
  const DetailsBottomBar({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:15,vertical: 24 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonDetails(product: product,),
         Image.asset('assets/images/unheart.png',height: 42,width: 42,)
        ],
      ),
    );
  }
}
