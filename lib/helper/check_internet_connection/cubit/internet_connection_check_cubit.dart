import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_connection_check_state.dart';

class InternetConnectionCheckCubit extends Cubit<InternetConnectionCheckState> {
  InternetConnectionCheckCubit() : super(InternetConnectionCheckInitial());

  StreamSubscription? streamSubscription;

  checkInternetConnection()async{
    streamSubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result == ConnectivityResult.none){
      emit(InternetConnectionError());
    }else{
      emit(InternetConnectionSuccess());
    }
  });
  }
  @override
  Future<void> close() {
    streamSubscription!.cancel();
    return super.close();
  }
}