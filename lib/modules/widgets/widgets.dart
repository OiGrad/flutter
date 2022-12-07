import 'package:flutter/material.dart';
import 'package:kemet/core/colors.dart';

Widget defaultTextFormField(
    {initValue,
    required validator,
    function,
    required controller,
    required label,
     hintText,}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        5.0,
      ),
      border: Border.all(
        color: AppColors.black,
      ),
    ),
    child: TextFormField(
      initialValue: initValue,
      validator: validator,
      onFieldSubmitted: (value) {

      },
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: Row(
          children: [
            const SizedBox(width: 10,),
            Text(
                label,
              style: TextStyle(color: AppColors.black),
            ),
          ],
        ),
        hintText: hintText,
      ),
    ),
  );
}

Widget defaultButton({
  double r = 10.0,
  required String text,
  required Color color ,
   Color txtColor = Colors.white ,
  required function,
  required context,
}) =>
    Container(
      width: MediaQuery.of(context).size.width*0.80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset:const Offset(0, 4), // changes position of shadow
          ),
        ]
      ),
      child: TextButton(
        onPressed: function,
        child: Text(
          text,
          style:  TextStyle(
            color: txtColor,
          ),
        ),
      ),
    );
