import 'package:bloc/bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'home_screen_and_navigation_bar_state.dart';

class HomeScreenAndNavigationBarCubit
    extends Cubit<HomeScreenAndNavigationBarState> {
  HomeScreenAndNavigationBarCubit()
      : super(HomeScreenAndNavigationBarInitial());

   int currentIndex = 0;
   ShapeBorder bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );
   EdgeInsets padding = const EdgeInsets.all(30);
   SnakeShape snakeShape = SnakeShape.circle;

  List<BottomNavigationBarItem> bottomNavigationBarItems =const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.bookmark_added_outlined), label: 'home'),
    BottomNavigationBarItem(icon: Icon(Icons.comment), label: 'microphone'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'search')
  ];
  void changeBottomNavigationBarIndex(newIndex){
    emit(HomeScreenAndNavigationBarCurrentIndex());
    currentIndex = newIndex;
    emit(HomeScreenAndNavigationBarMovingIndex());
  }
}
