import 'package:flutter/material.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/modules/widgets/home_screen_widgets.dart';
import 'package:kemet/core/media_query_values.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                welcomeWidget(context),
                textWidget(context, AppStringsInArabic.favoritePlacesForYou,
                    25.0, AppColors.black),
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: MediaQueryValues(context).height*1/4,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: MediaQueryValues(context).width*1/30,
                  ),
                  itemBuilder: (context, item) {
                    return cardOfPlace(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
