import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kemet/core/navigation.dart';
import 'package:kemet/modules/egypt_governorates/egypt_governorates_screen.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  final searchController = TextEditingController();

  void validateSearchResult(value){}

  void goToEgyptGovernorates(context){
    navigateTo(context,const EgyptGovernoratesScreen());
    emit(GoingToEgyptGovernoratesScreenSuccess());
  }

}
