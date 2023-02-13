import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_screen_state.dart';

class UserScreenCubit extends Cubit<UserScreenState> {
  UserScreenCubit() : super(UserScreenInitial());
}
