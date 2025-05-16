import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';

class ColorsRow extends StatelessWidget {
  const ColorsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
               const Text('Colors:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                const SizedBox(width: 10,),
                Container(
                  height: 25,
                  width: 25,
                  decoration:const BoxDecoration(
                    color:AppColors.pinkColor,
                    shape: BoxShape.circle
                  ),
                ),
                const SizedBox(width: 5,),
                 Container(
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                    color:AppColors.greyColor,
                    shape: BoxShape.circle
                  ),
                ),
                const SizedBox(width: 5,),
                Container(
                  height: 25,
                  width: 25,
                  decoration:const BoxDecoration(
                    color:AppColors.secondryColor,
                    shape: BoxShape.circle
                  ),
                ),
                const SizedBox(width: 5,),
                Container(
                  height: 25,
                  width: 25,
                  decoration:const BoxDecoration(
                    color:AppColors.primaryColor,
                    shape: BoxShape.circle
                  ),
                ),
              ],
            );
  }
}