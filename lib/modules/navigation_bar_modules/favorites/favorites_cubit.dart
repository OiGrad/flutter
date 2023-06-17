import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../helper/end_points.dart';
import '../../../helper/remote/dio_helper.dart';
import '../../../models/place_model.dart';
import '../../widgets/snackbar_widget.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  List<Place> places = [];

  void getPlaces({required BuildContext context}) async {
    emit(GetFavoritPlacesLoading());

    await DioHelper.getData(
      url: AppEndPoints.getFavPlaces,
    ).then((value) {
      if ((value.data['results'] as List).isNotEmpty) {
        value.data['results'][0]['place'].forEach((e) {
          places.add(Place.fromJson(e));
        });
      }
      emit(GetFavoritPlacesSuccess());
    }).catchError((err) {
      showSnackBar(
          context: context, text: 'Error in get Places', clr: Colors.red);
      emit(GetFavoritPlacesError());
    });
  }
}
