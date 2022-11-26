import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_and_sign_up_state.dart';

class SignInAndSignUpCubit extends Cubit<SignInAndSignUpState> {
  SignInAndSignUpCubit() : super(SignInAndSignUpInitial());
}
