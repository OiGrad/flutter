import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kemet/models/place_hint.dart';
import 'package:kemet/models/place_model.dart';
import 'package:meta/meta.dart';
import 'package:kemet/helper/remote/dio_helper.dart';

import '../../core/colors.dart';
import '../../core/strings.dart';
import '../../helper/end_points.dart';
import '../widgets/snackbar_widget.dart';

part 'place_search_page_state.dart';

class PlaceSearchPageCubit extends Cubit<PlaceSearchPageState> {
  PlaceSearchPageCubit() : super(PlaceSearchPageInitial());

  List<PlaceHint> searchResults = [];

  void getSearchResuls(BuildContext context, String query) {
    emit(GetPlacesLoading());
    DioHelper.getData(
      url: AppEndPoints.searchPlaces,
      query: {"name": query},
    ).then(
      (value) {
        searchResults = [];
        print(value.data);
        value.data.forEach((e) {
          searchResults.add(PlaceHint.fromJson(e));
        });
        emit(GetPlacesSuccess());
      },
    ).catchError((e) {
      print(e.toString());
      showSnackBar(
          context: context,
          text: AppStringsInEnglish.errorGetingPlaces,
          clr: AppColors.error);
      emit(GetPlacesError());
    });
  }

  addSomePlaces() {
    searchResults = [
      PlaceHint(id: 1, name: 'مسجد الحسين', image: 'assets/images/1.jpg'),
      PlaceHint(id: 2, name: 'مسجد السلطان حسن', image: 'assets/images/2.jpg'),
      PlaceHint(id: 3, name: 'مسجد الازهر', image: 'assets/images/3.jpg'),
      PlaceHint(
          id: 4, name: 'مسجد عمرو بن العاص', image: 'assets/images/4.jpg'),
      PlaceHint(
          id: 5, name: 'مسجد احمد ابن طولون', image: 'assets/images/5.jpg'),
    ];
    emit(UpdatePlacesSuccess());
  }
}
