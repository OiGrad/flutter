import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/core/media_query_values.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/modules/%20login_and_signup/sign_in_and_sign_up_cubit.dart';

import '../../core/navigation.dart';
import '../city_details/city_details_screen.dart';
import '../place_details/place_details_screen.dart';

Widget welcomeWidget(context) {
  return Column(
    children: [
      Container(
        height: MediaQueryValues(context).height * 1 / 10,
        decoration: BoxDecoration(
          color: AppColors.blackWithOpacity,
          borderRadius: BorderRadius.circular(19),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: MediaQueryValues(context).width * 1 / 14,
                backgroundColor: AppColors.primaryLight,
                child: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: MediaQueryValues(context).width * 1 / 19,
                  child: Text(
                    'ENG',
                    style: TextStyle(color: AppColors.black),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        BlocConsumer<SignInAndSignUpCubit , SignInAndSignUpState>(
                          listener:(context , state){} ,
                          builder: (context , state){
                            return Text(
                              BlocProvider.of<SignInAndSignUpCubit>(context).userModel!.username,
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.white,
                                fontFamily: 'Tajawal',
                              ),
                            );
                          },
                        ),

                        Text(
                          AppStringsInArabic.welcomeInHomeScreen,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.white,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      AppStringsInArabic.governorate,
                      style: TextStyle(
                        color: AppColors.orange,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Image.asset(
                  'assets/images/dommy_photo_home_screen.png',
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget textWidget(context, text, size, textColor) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30),
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontFamily: 'Tajawal',
        fontSize: size.toDouble(),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget categoryWidget(context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: MediaQueryValues(context).width * 1 / 3,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: MediaQueryValues(context).height * 1 / 25,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset('assets/images/category1.png'),
            const Spacer(),
            const Text(
              'أماكن أثرية',
              style: TextStyle(fontFamily: 'Tajawal'),
            ),
            const Spacer(),
          ],
        ),
      ),
    ),
  );
}

Widget cardOfPlace(context) {
  return InkWell(
    onTap: () {
      navigateTo(context, PlaceView());
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: MediaQueryValues(context).height * 5 / 20,
      width: MediaQueryValues(context).width * 5 / 11,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQueryValues(context).height * 2 / 14,
            child: Image.asset('assets/images/test.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'الكنيسة المعلقة',
                  style: TextStyle(
                      fontFamily: 'Tajawal', fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                      minRadius: 10,
                      child: Icon(Icons.favorite,
                          size: 15, color: AppColors.white),
                    ),
                    const Text(
                      'مبني أثري',
                      style: TextStyle(fontFamily: 'Tajawal'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget cardOfGov(context) {
  return InkWell(
    onTap: () {
      navigateTo(context, CityView());
    },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      height: MediaQueryValues(context).height * 5 / 20,
      width: MediaQueryValues(context).width * 5 / 11,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQueryValues(context).height * 2 / 14,
            child: Image.asset('assets/images/cairo.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'القاهره',
                  style: TextStyle(
                      fontFamily: 'Tajawal', fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                      minRadius: 10,
                      child: Icon(Icons.favorite,
                          size: 15, color: AppColors.white),
                    ),
                    const Spacer(),
                    const Text(
                      'العاصمه',
                      style: TextStyle(fontFamily: 'Tajawal'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

/*
GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: getVerticalSize(
                        188.00,
                      ),
                      crossAxisCount: 2,
                      mainAxisSpacing: getHorizontalSize(
                        20.00,
                      ),
                      crossAxisSpacing: getHorizontalSize(
                        20.00,
                      ),
                    ),
                    physics: BouncingScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ElkermItemWidget();
                    },
                  ),
 */
/*
Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "عرض المزيد",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtTajawalMedium17Orange600,
              ),
              Text(
                "محافظات مصر",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtTajawalMedium17,
              ),
            ],
          ),
 */
