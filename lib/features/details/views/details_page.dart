import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/details/widgets/details_bottom_bar.dart';
import 'package:shopping_app/features/details/widgets/image_container.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
         padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageContainer(),
            SizedBox(height: 10,),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bijama Set',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                       Text(
                          '\$49',
                          style: TextStyle(
                            color: AppColors.secondryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 7,),
                      Row(children: [
                        Icon(Icons.star,color: Colors.yellow,),
                        Text('3.3',style: TextStyle(fontSize: 18),)
                      ],),   
                    ],
                  )
              ],
            ),
            SizedBox(height: 15,),
           Text('About this',style: TextStyle(fontSize:16 ),),
           SizedBox(height: 10,),
           Text('A soft and breathable cotton pajama set designed to provide maximum comfort during your sleep. Its lightweight fabric keeps you cool on warm nights, while the relaxed fit allows for easy movement and a cozy feel.'),
          
          ],
        ),
      ),
      bottomNavigationBar: DetailsBottomBar(),
    );
  }
}