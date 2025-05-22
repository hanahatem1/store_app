
import 'package:flutter/material.dart';

class CustomButtonCart extends StatelessWidget {
  const CustomButtonCart({super.key,  required this.text, required this.color1, required this.color2, required this.colorText});


final String text;
final Color color1;
final Color color2;
final Color colorText;
  @override
  Widget build(BuildContext context) {
    return Container(
        height:38 ,
        width: 330,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color:color1
            ),
            color: color2
            ),
        child: Center(
          child: Text(
            text,
            style: TextStyle( fontSize: 16,color: colorText,fontWeight: FontWeight.bold),
          ),
        ));
  }
}
