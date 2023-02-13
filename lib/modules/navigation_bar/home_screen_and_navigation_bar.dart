import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/core/media_query_values.dart';
import 'package:kemet/modules/navigation_bar/home_screen_and_navigation_bar_cubit.dart';

class HomeScreenAndNavigationBar extends StatelessWidget {
  const HomeScreenAndNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenAndNavigationBarCubit(),
      child: BlocConsumer<HomeScreenAndNavigationBarCubit,
          HomeScreenAndNavigationBarState>(
        listener: (context, state) {},
        builder: (context, state) {
          final myBloc =
              BlocProvider.of<HomeScreenAndNavigationBarCubit>(context);
          return Scaffold(
            body:Stack(
              alignment: Alignment.bottomCenter,
              children: [
                myBloc.screensOfNavBar[myBloc.currentIndex],
                SnakeNavigationBar.color(
                  height: MediaQueryValues(context).height*1/12,
                  shape: myBloc.bottomBarShape,
                  currentIndex: myBloc.currentIndex,
                  backgroundColor: AppColors.primary,
                  unselectedItemColor: AppColors.black,
                  selectedItemColor: AppColors.white,
                  padding: myBloc.padding,
                  items: myBloc.bottomNavigationBarItems,
                  snakeShape: myBloc.snakeShape,
                  snakeViewColor:AppColors.black,
                  onTap:(index){
                    myBloc.changeBottomNavigationBarIndex(index);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
