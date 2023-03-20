import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part './travel_assistant_state.dart';

class TravelAssistantCubit extends Cubit<TravelAssistantState> {
  TravelAssistantCubit() : super(TravelAssistantInitial());
}
