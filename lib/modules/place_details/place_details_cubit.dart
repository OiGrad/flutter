import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part './place_details_state.dart';

class PlaceDetailsCubit extends Cubit<PlaceDetailsState> {
  PlaceDetailsCubit() : super(PlaceDetailsInitial());
}
