import 'package:flutter/material.dart';
import 'package:kemet/core/colors.dart';

Widget defaultTextFormField({
  initValue,
  required validator,
  function,
  required controller,
  required label,
  labelColor,
  required bool arabic,
  hintText,
  icon,
  iconColor,
}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
      borderRadius: BorderRadius.circular(
        5.0,
      ),
      border: Border.all(
        color: AppColors.black,
        width: 0.1
      ),
    ),
    child: TextFormField(
      initialValue: initValue,
      validator: validator,
      onFieldSubmitted: (value) {},
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        label: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              if(icon != null)Icon(icon,color: iconColor,),
              const SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: TextStyle(color:labelColor==null?AppColors.black:labelColor),
              ),
            ],
          ),
        ),
        hintText: hintText,
      ),
    ),
  );
}

Widget defaultButton({
  Widget? img,
  double? width,
  double r = 10.0,
  required String text,
  required Color color,
  Color txtColor = Colors.white,
  required function,
  required context,
}) =>
    Container(
      width: width==null?MediaQuery.of(context).size.width * 0.80:width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            r,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ]
      ),
      child: TextButton(
        onPressed: function,
        child: img == null
            ? Text(
                text,
                style: TextStyle(
                  color: txtColor,
                ),
              )
            : Row(
                children: [
                  const SizedBox(
                    width: 60,
                  ),
                  img,
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: txtColor,
                    ),
                  )
                ],
              ),
      ),
    );

