import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_circle_container.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Image.network(
            product.image,
            width:360,
            height:360,
            fit: BoxFit.cover,
          ),
        ),
      ),
       Positioned(
          top: 9,
          left: 6,
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child:const CustomCircleContainer(
                color: AppColors.cardColor,
                child: Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                )),
          ))
    ]);
  }
}
