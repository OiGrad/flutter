part of 'place_details_cubit.dart';

@immutable
abstract class PlaceDetailsState {}

class PlaceDetailsInitial extends PlaceDetailsState {}

class SetAsFavLoading extends PlaceDetailsState {}

class SetAsFavSuccess extends PlaceDetailsState {}

class SetAsFavError extends PlaceDetailsState {}
