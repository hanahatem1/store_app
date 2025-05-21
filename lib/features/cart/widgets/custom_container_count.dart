import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';

class CustomContainerCount extends StatefulWidget {
  const CustomContainerCount({super.key, required this.countNum});

final String countNum;

  @override
  State<CustomContainerCount> createState() => _CustomContainerCountState();
}

class _CustomContainerCountState extends State<CustomContainerCount> {

late int count=1;
  @override
void initState(){
  super.initState();
  count=int.parse(widget.countNum);
}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.backGroundColor,
          borderRadius: BorderRadius.circular(24)),
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        child: Row(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  if(count==1){
                    count=1;
                  }else{
                  -- count ;
                  }
                });
              },
              child: const Icon(
                Icons.remove,
                size: 17,
              ),
            ),
            const SizedBox(width: 3,),
            Text(count.toString()),
            const SizedBox(width: 3,),
            GestureDetector(
              onTap: (){
                setState(() {
                   ++ count ;
                });
              },
              child: const Icon(
                Icons.add,
                size: 17,
              ),
            )
          ],
        ),
      ),
    );
  }
}
