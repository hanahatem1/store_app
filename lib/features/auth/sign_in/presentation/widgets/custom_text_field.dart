import 'package:flutter/material.dart';
import 'package:shopping_app/core/constant/app_colors.dart';

class customTextField extends StatelessWidget {
   customTextField({super.key,required this.hintText,this.onChanged,this.obscureText=false,required this.labelText});

 Function(String)? onChanged;
 String hintText;
 String labelText;
 bool obscureText;
  @override
   Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        const SizedBox(height: 5,),
        SizedBox(
          height: 50,
          child: TextFormField(
            obscureText: obscureText,
            validator: (data){
              if(data!.isEmpty){
                return 'this field is required';
              }
            },
            onChanged: onChanged,
            cursorColor: AppColors.greyColor,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle:const TextStyle(color: AppColors.greyColor),
                      fillColor:AppColors.backGroundColor,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide:const BorderSide(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      enabledBorder: OutlineInputBorder(
                         borderSide:const BorderSide(color:AppColors.greyColor),
                          borderRadius: BorderRadius.circular(12)
                      )
                    ),
                  ),
        ),
      ],
    );
        
   }
}