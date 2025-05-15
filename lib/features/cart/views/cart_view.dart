import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        title: const Text(
          'Shoppin Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            Card(
              color: AppColors.cardColor,
              elevation: 2,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Image.asset(
                      'assets/images/b.jpg',
                      height: 120,
                      width: 120,
                    ),
                  ),
                  const SizedBox(width: 14,),
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bijama set',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\$49',
                          style: TextStyle(color: AppColors.secondryColor),
                        )
                      ],
                    ),
                    const SizedBox(width: 50,),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.backGroundColor,
                        borderRadius: BorderRadius.circular(24)
                      ),
                      child:const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.remove,size: 17,),
                            Text('1'),
                            Icon(Icons.add,size: 17,)
                          ],
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
