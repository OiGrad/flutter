import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/core/media_query_values.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/modules/navigation_bar_modules/home/home_screen_cubit.dart';
import 'package:kemet/modules/widgets/home_screen_widgets.dart';
import 'package:kemet/modules/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          var myBloc = BlocProvider.of<HomeScreenCubit>(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      welcomeWidget(context),
                      textWidget(context, AppStringsInArabic.whereWillYouGo,
                          25.0, AppColors.black),
                      defaultTextFormField(
                          arabic: true,
                          validator: (value) {
                            myBloc.validateSearchResult(value);
                          },
                          controller: myBloc.searchController,
                          label: AppStringsInArabic.search,
                          labelColor: AppColors.hint,
                          icon: Icons.search,
                          iconColor: AppColors.hint),

                      ///TODO : Categories
                      textWidget(context, AppStringsInArabic.categories, 18.0,
                          AppColors.black),
                      SizedBox(
                        height: 50,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, item) =>
                                categoryWidget(context),
                          ),
                        ),
                      ),

                      /// TODO : Popular
                      textWidget(context, AppStringsInArabic.popularPlaces,
                          18.0, AppColors.black),

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

                      ///TODO : Egypt
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              myBloc.goToEgyptGovernorates(context);
                            },
                            child: textWidget(
                              context,
                              AppStringsInArabic.showMore,
                              18.0,
                              AppColors.primary,
                            ),
                          ),
                          const Spacer(),
                          textWidget(
                              context,
                              AppStringsInArabic.egyptGovernorates,
                              18.0,
                              AppColors.black),
                        ],
                      ),
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
                          return cardOfPlace2(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}