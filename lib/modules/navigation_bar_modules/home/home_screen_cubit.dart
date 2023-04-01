import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kemet/core/navigation.dart';
import 'package:kemet/helper/end_points.dart';
import 'package:kemet/helper/remote/dio_helper.dart';
import 'package:kemet/models/place_category.dart';
import 'package:kemet/modules/egypt_governorates/egypt_governorates_screen.dart';
import 'package:kemet/modules/widgets/snackbar_widget.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  List<PlaceCategory>? placesCategory;


  void getCategory({required BuildContext context}) {
    emit(GetCategoryLoading());

    DioHelper.getData(
      url: AppEndPoints.getCategory,
    ).then((value) {
      value.data['results'].forEach((e){
        placesCategory!.add(PlaceCategory.fromJson(e));
      });
      emit(GetCategorySuccess());
    }).catchError((err) {
      showSnackBar(context: context, text: 'Error in get Category', clr: Colors.red);
      emit(GetCategoryError());
    });
  }

  final searchController = TextEditingController();

  void validateSearchResult(value) {}

  void goToEgyptGovernorates(context) {
    navigateTo(context, const EgyptGovernoratesScreen());
    emit(GoingToEgyptGovernoratesScreenSuccess());
  }
}
