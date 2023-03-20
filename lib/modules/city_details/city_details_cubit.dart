import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part './city_details_state.dart';

class CityDetailsCubit extends Cubit<CityDetailsState> {
  CityDetailsCubit() : super(CityDetailsInitial());
}
